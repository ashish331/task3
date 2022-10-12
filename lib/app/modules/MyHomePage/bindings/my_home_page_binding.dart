import 'package:get/get.dart';

import '../controllers/my_home_page_controller.dart';

class MyHomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyHomePageController>(
      () => MyHomePageController(),
    );
  }
}
