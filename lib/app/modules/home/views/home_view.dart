// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task-3'),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        width: Get.width - 50,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.name,
              // obscureText: true,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.email,
              // obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            Obx(() => DropdownButton(
                  // Initial Value
                  isExpanded: true,
                  //value: controller.selectBrand.value,
                  hint: Text(
                    controller.selectedValue.value,
                    style: TextStyle(
                      fontFamily: 'MalgunGothicBold',
                      fontSize: 14,
                      color: Color.fromARGB(110, 39, 39, 39),
                      letterSpacing: -0.28,
                      height: 1.0714285714285714,
                    ),
                  ),
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: controller.values.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (dynamic value) {
                    if (value != null) {
                      controller.selectedValue.value = value;

                      // controller.selectBrand.value =
                      //     value['brand'].toString();

                    } else {
                      //selected=null;
                    }
                  },
                )),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: () {
                controller.sigin();
              },
            )
          ],
        ),
      )),
    );
  }
}
