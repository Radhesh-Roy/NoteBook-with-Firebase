import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:note_book/controller/homeController/home_controller.dart';
import 'package:note_book/controller/note_add_controller/add_controller.dart';

import '../firebase_service.dart';
import 'note_add.dart';
import 'note_edit.dart';

class NoteHome extends StatefulWidget {

  final Map<String, dynamic> data;

  NoteHome({super.key, required this.data});
  @override
  State<NoteHome> createState() => _NoteHomeState();
}

class _NoteHomeState extends State<NoteHome> {
  List allNotes= [];
  void getNotes() async {
    DataSnapshot snapshot= await db.ref().child("My Notes").get();
    if(snapshot.exists){
      Map data=snapshot.value as Map;
      allNotes.clear();
      data.forEach((key, value){
        allNotes.add({
          "id":key,
          "title": value["title"],
          "description": value["description"]
        });
      });

      setState(() {

      });

    }

  }
  @override
  void initState() {

    super.initState();
    getNotes();
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE1E1E1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      drawer: Drawer(backgroundColor: Color(0xffE1E1E1)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Notes",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                fontFamily: "Playfair",
              ),
            ),

            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_outlined, color: Colors.grey),
                suffixIcon: Icon(Icons.mic, color: Colors.grey),
                hintText: "Search Your Note",
                hintStyle: TextStyle(color: Colors.grey),
                hoverColor: Colors.transparent,
                fillColor: Color(0xffEFEFEF),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:allNotes.length,
                itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  confirmDismiss: (direction) async{
                    if(direction==DismissDirection.endToStart){

                      await db.ref().child("My Notes").child(allNotes[index]["id"]).remove();

                   setState(() {

                     allNotes.removeAt(index);
                   });
                    }
                    else if(direction== DismissDirection.startToEnd){
                      var data={
                        "title": allNotes[index]["title"],
                        "description": allNotes[index]["description"]

                      };
                     Navigator.push(context, MaterialPageRoute(builder: (context) => NoteEdit(data: data,)));
                    }
                  },
                  background: Container(
                    decoration: BoxDecoration(color: Colors.green),
                    child: Center(
                      child: Icon(
                        Icons.edit_note,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Center(
                      child: Icon(Icons.delete, size: 30, color: Colors.white),
                    ),
                  ),
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {
                    },
                    child: Container(
                      margin: EdgeInsets.all(3),
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff0ffEFEFEF),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "${allNotes[index]["title"]}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff444545),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Text(
                                  "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                                  style: TextStyle(color: Color(0xff444545)),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Text(
                                "${allNotes[index]["description"]}",
                                style: TextStyle(color: Color(0xff444545)),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffE1E1E1),
        hoverColor: Colors.transparent,
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NoteAddScreen(),));

       getNotes();

        },
        child: Center(child: Icon(Icons.add)),
      ),
    );
  }
}
