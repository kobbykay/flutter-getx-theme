import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtheme/theme_controller.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.find();
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            actions: [
              IconButton(
                icon: Icon(
                  themeController.currentThemeMode.value == ThemeMode.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
                onPressed: () {
                  if (themeController.currentThemeMode.value ==
                      ThemeMode.dark) {
                    themeController.setLightTheme();
                  } else {
                    themeController.setDarkTheme();
                  }
                },
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: homeController.dataList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  homeController.dataList[index],
                  style: TextStyle(
                    color:
                        themeController.currentThemeMode.value == ThemeMode.dark
                            ? Colors.yellow
                            : Colors.red,
                  ),
                ),
              );
            },
          ),
        ));
  }
}
