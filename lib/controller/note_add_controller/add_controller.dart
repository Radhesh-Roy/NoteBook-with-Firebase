import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteAddController extends GetxController{
TextEditingController titleC= TextEditingController();
TextEditingController descriptionC= TextEditingController();

void getData(){
  String title= titleC.text;
  String description= descriptionC.text;
  log("$title");
  log("$description");
}

}