import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_book/firebase_service.dart';

class NoteEdit extends StatefulWidget {
  final Map data;
  const NoteEdit({super.key, required this.data });

  @override
  State<NoteEdit> createState() => _NoteAddState();

}
class _NoteAddState extends State<NoteEdit> {
  TextEditingController titleC= TextEditingController();
  TextEditingController descriptionC= TextEditingController();

 void getData(){

   titleC.text=widget.data["title"]??"";
   descriptionC.text=widget.data["description"]??"";

  }
  @override
  void initState() {

    super.initState();
getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE1E1E1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text("Edit Note", style: TextStyle(fontFamily: "Playfair", fontWeight: FontWeight.w600),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: IconButton(
                onPressed: ()async{
                  await db.ref().child("My Notes").child(widget.data["id"]).update(
                      {
                        "title": widget.data["title"],
                        "description": widget.data["description"]
                      });
                  log("Radhesh");
                  Navigator.pop(context);
                  
                },icon: Icon(Icons.check),

          )
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
