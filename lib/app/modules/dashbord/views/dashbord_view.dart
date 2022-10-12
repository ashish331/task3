import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashbord_controller.dart';

class DashbordView extends GetView<DashbordController> {
  const DashbordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashbordView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DashbordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
