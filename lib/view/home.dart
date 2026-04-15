import 'dart:developer';

import 'package:flutter/material.dart';

import 'note_add.dart';
import 'note_edit.dart';

class NoteHome extends StatefulWidget {
  const NoteHome({super.key});

  @override
  State<NoteHome> createState() => _NoteHomeState();
}

final now = DateTime.now();
final day = now.day;
final month = now.month;
final year = now.year;

class _NoteHomeState extends State<NoteHome> {
  List<NoteModel> noteData = [];

  getByData() async {
    var data = await GetData().getData();
    noteData = data;
    setState(() {
    });
  }
  @override
  void initState() {
    getByData();
    super.initState();
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
                itemCount: noteData.length,
                itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  confirmDismiss: (direction) async{
                    if(direction==DismissDirection.endToStart){
                      var success=await NoteDelete().deleteNote(id: index);
                    }
                    else if(direction== DismissDirection.startToEnd){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NoteEdit()));
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

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NoteEdit(id: noteData[index].id, notes: noteData[index].note,)),
                      );
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
                                    "No Title",
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
                                  "${day}/${month}/${year}",
                                  style: TextStyle(color: Color(0xff444545)),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Text(
                                "${noteData[index].note}",
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteAddScreen()),
          ).then((v){getByData();});
        },
        child: Center(child: Icon(Icons.add)),
      ),
    );
  }
}
