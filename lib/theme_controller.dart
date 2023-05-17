import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var currentThemeMode = ThemeMode.light.obs; // Use Rx<ThemeMode>

  @override
  void onInit() {
    loadTheme();
    super.onInit();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString('theme');

    if (savedTheme == 'dark') {
      setDarkTheme();
    } else {
      setLightTheme();
    }
  }

  void setLightTheme() {
    Get.changeThemeMode(ThemeMode.light);
    currentThemeMode.value = ThemeMode.light;
    Get.changeTheme(CustomLightTheme().themeData);
    saveTheme();
  }

  void setDarkTheme() {
    //  Get.changeThemeMode(ThemeMode.dark);
    currentThemeMode.value = ThemeMode.dark;
    Get.changeTheme(CustomDarkTheme().themeData);
    saveTheme();
  }

  Future<void> saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'theme', currentThemeMode.value.toString().split('.').last);
    print(currentThemeMode.value.toString().split('.').last);
  }
}

class CustomDarkTheme {
  ThemeData get themeData => ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.red,
        ),
        scaffoldBackgroundColor: Colors.orange,
      );
}

class CustomLightTheme {
  ThemeData get themeData => ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.pink,
        ),
        scaffoldBackgroundColor: Colors.blue,
      );
}
