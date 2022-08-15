import 'package:get/get.dart';
import 'package:emergencia190/src/pages/auth/view/sign_in_screen.dart';
import 'package:emergencia190/src/pages/auth/view/sign_up_screen.dart';
import 'package:emergencia190/src/pages/base/base_screen.dart';
import 'package:emergencia190/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRouts.splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: PagesRouts.signInRoute,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: PagesRouts.signUpRoute,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: PagesRouts.baseRoute,
      page: () => const BaseScreen(),
    )
  ];
}

abstract class PagesRouts {
  static String baseRoute = "/";
  static String splashRoute = "/splash";
  static String signInRoute = "/signin";
  static String signUpRoute = "/signup";
}
