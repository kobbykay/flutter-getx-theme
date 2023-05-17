import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtheme/theme_controller.dart';

import 'home_controller.dart';
import 'homepage.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final ThemeController themeController = Get.put(ThemeController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx State Management',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode:
          themeController.currentThemeMode.value, // Use currentThemeMode value
      home: HomePage(),
    );
  }
}
