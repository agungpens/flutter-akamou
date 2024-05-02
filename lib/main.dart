import 'package:flutter_akamou/controller/my_controller.dart';
import 'package:flutter_akamou/pages/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controllerC = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        theme: controllerC.isDark.value ? ThemeData.light() : ThemeData.dark(),
        home: LoginPage(),
      ),
    );
  }
}
