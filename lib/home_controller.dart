import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<String> dataList = <String>[].obs;

  @override
  void onInit() {
    fetchDataFromApi();
    super.onInit();
  }

  void fetchDataFromApi() {
    // Simulating API call delay
    Future.delayed(const Duration(seconds: 2), () {
      dataList.assignAll([
        'Item 1',
        'Item 2',
        'Item 3',
        // Add more items if needed
      ]);
    });
  }
}
