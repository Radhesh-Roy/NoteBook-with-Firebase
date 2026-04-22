import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:note_book/controller/homeController/home_controller.dart';
import 'package:note_book/controller/note_add_controller/add_controller.dart';
import 'package:note_book/firebase_service.dart';
import 'home.dart';

class NoteAddScreen extends StatefulWidget {
  const NoteAddScreen({super.key,});

  @override
  State<NoteAddScreen> createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {
   TextEditingController titleC= TextEditingController();
   TextEditingController descriptionC= TextEditingController();

   @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffE1E1E1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text("Add Note", style: TextStyle(fontFamily: "Playfair", fontWeight: FontWeight.w600),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: IconButton(
                onPressed: () async{
                  var data= {
                    "title": titleC.text,
                    "description": descriptionC.text
                  };
                 await db.ref().child("My Notes").push().set(
                      {
                        "title": titleC.text,
                        "description": descriptionC.text,
                        "time": DateTime.now()
                      }
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NoteHome(data: data,),));

                },
                icon: Icon(Icons.check)),
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: titleC,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            decoration: InputDecoration(
                hintText: "Add Title",
                hintStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                )
            ),
          ),

          Container(
            child: TextField(
              controller:descriptionC,
              decoration: InputDecoration(
                  hintText: "Add Description",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
