import 'package:get/get.dart';
import 'package:emergencia190/src/constants/storage_keys.dart';
import 'package:emergencia190/src/models/user_model.dart';
import 'package:emergencia190/src/pages/auth/repository/auth_repository.dart';
import 'package:emergencia190/src/pages/auth/result/auth_result.dart';
import 'package:emergencia190/src/pages_routes/app_pages.dart';
import 'package:emergencia190/src/services/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();

  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();

    validateToken();
  }

  Future<void> validateToken() async {
    // Recuperar token salvo localmente
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRouts.signInRoute);
      return;
    }

    AuthResult result = await authRepository.validateToken(token);

    result.when(success: (user) {
      this.user = user;
      saveTokenAndProceedToBase();
    }, error: (message) {
      signOut();
    });
  }

  Future<void> signOut() async {
    // Zerar o user
    user = UserModel();
    // Remover o token localmente
    await utilsServices.removeLocalData(key: StorageKeys.token);
    // Ir para o login
    Get.offAllNamed(PagesRouts.signInRoute);
  }

  void saveTokenAndProceedToBase() {
    // Salvar Token
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);

    // Ir para a base url
    Get.offAllNamed(PagesRouts.baseRoute);
  }

  Future<void> signUp() async {
    isLoading.value = true;

    AuthResult result = await authRepository.signUp(user);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
