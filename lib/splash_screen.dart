import 'package:flutter/material.dart';
import 'package:note_book/view/home.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  splashNavigate() async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NoteHome(),));

  }
  @override
  void initState() {
    splashNavigate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(

        child: Image.asset("assets/Notebook.png", height: 250, width: 250,),
      ),
    );
  }
}

