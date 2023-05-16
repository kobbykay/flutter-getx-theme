import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final Rx<Brightness> currentTheme = Brightness.light.obs;

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
    currentTheme.value = Brightness.light;
    saveTheme();
  }

  void setDarkTheme() {
    Get.changeThemeMode(ThemeMode.dark);
    currentTheme.value = Brightness.dark;
    saveTheme();
  }

  Future<void> saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', currentTheme.value.toString().split('.').last);
  }
}
