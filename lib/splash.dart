import 'package:flutter/material.dart';
import 'package:temperaturapps/home.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  late Size size;

  @override 
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LivingRoomPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue.shade300, 
              Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Image.asset("lib/assets/suhu.png", height: 100, width: 100,),
      ),
    );
  }
}