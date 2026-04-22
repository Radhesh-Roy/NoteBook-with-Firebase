import 'dart:developer';

import 'package:get/get.dart';
import 'package:note_book/controller/note_add_controller/add_controller.dart';

class HomeController extends GetxController{

  final NoteAddController ac= Get.find();

  RxList data=[].obs;

 void getbyData()async{

    data.value= await NoteAddController().getData();

    log("$data");

  }




  }