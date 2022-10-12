import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task3/main.dart';

import '../../../routes/app_pages.dart';
import '../../MyHomePage/views/my_home_page_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  final count = 0.obs;
  var selectedValue = "where are you coming from".obs;
  var values = ["Facebook", "Instagram", "Organic", "Friend", "Google"].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void sigin() {
    if (name.text.isEmpty ||
        email.text.isEmpty ||
        selectedValue.value == "where are you coming from") {
      Get.snackbar("Hy", "Fill all the fileds");
      return;
    }
    Person newData = Person(name.text, email.text, selectedValue.value);
    var data = GetStorage().read("data") ?? [];
    if (data.isEmpty) {
      data.add(newData);
      GetStorage().write("data", data);
    } else {
      data.add(newData);
      GetStorage().write("data", data);
    }
    Get.to(MyHomePage());
  }
}
