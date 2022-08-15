import 'package:emergencia190/src/constants/endpoints.dart';
import 'package:emergencia190/src/models/user_model.dart';
import 'package:emergencia190/src/pages/auth/repository/auth_errors.dart'
    as authErrors;
import 'package:emergencia190/src/pages/auth/result/auth_result.dart';
import 'package:emergencia190/src/services/http_manager.dart';

class AuthRepository {
  final HttpManeger _httpManeger = HttpManeger();

  AuthResult _handleUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);

      return AuthResult.success(user);
    }

    return AuthResult.error(authErrors.authErrorsString(result['error']));
  }

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManeger.restRequest(
      url: EndPoints.validateToken,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    return _handleUserOrError(result);
  }

  Future<AuthResult> signIn(
      {required String email, required String password}) async {
    final result = await _httpManeger.restRequest(
      url: EndPoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    return _handleUserOrError(result);
  }

  Future<AuthResult> signUp(UserModel user) async {
    final result = await _httpManeger.restRequest(
      url: EndPoints.signup,
      method: HttpMethods.post,
      body: user.toJson(),
    );

    return _handleUserOrError(result);
  }
}
