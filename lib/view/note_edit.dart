import 'package:flutter/material.dart';

class NoteEdit extends StatefulWidget {
  const NoteEdit({super.key,  this.id,  this.notes});

  final int? id;
  final String? notes;

  @override
  State<NoteEdit> createState() => _NoteAddState();

}
class _NoteAddState extends State<NoteEdit> {
  TextEditingController Notesedit= TextEditingController();
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
            child: InkWell(
                onTap: (){},
                child: Icon(Icons.check)),
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
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
              controller:Notesedit,
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
