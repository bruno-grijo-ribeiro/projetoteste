import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emergencia190/src/pages/auth/controller/auth_controller.dart';
import 'package:emergencia190/src/pages_routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '190 Emergência',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRouts.splashRoute,
      getPages: AppPages.pages,
    );
  }
}
