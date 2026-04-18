import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteAddController extends GetxController{
TextEditingController titleC= TextEditingController();
TextEditingController descriptionC= TextEditingController();

void getData(){
  Map addData={
    "title": titleC.text,
    "description": descriptionC.text
  };
  log("$addData");
}

}