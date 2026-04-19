import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_book/controller/homeController/home_controller.dart';

class NoteAddController extends GetxController{
TextEditingController titleC= TextEditingController();
TextEditingController descriptionC= TextEditingController();

final HomeController homeController = Get.find<HomeController>();

void getData() {
  homeController.data.add({
    "title": titleC.text,
    "description": descriptionC.text,
  });

  titleC.clear();
  descriptionC.clear();
}
}