import 'package:flutter/material.dart';
import 'package:getxtheme/theme_controller.dart';
import 'home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {

   HomePage({Key? key}) : super(key: key);

   final HomeController homeController = Get.find();
   final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Obx(() => Icon(
              themeController.currentTheme.value == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            )),
            onPressed: () {
              if (themeController.currentTheme.value == ThemeMode.dark) {
                themeController.setLightTheme();
              } else {
                themeController.setDarkTheme();
              }
            },
          ),
        ],
      ),
      body: Obx(() => ListView.builder(
        itemCount: homeController.dataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(homeController.dataList[index]),
          );
        },
      )),
    );
  }
}
