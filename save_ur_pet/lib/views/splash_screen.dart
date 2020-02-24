import 'package:flutter/material.dart';
import 'dart:async';

import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/fondo.png"),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Image.asset(
                "images/logo_dos.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  startTime() async{
    var _duration = Duration(milliseconds: 1500);
    return Timer(_duration, startMainScreen);
  }

  startMainScreen(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
  }
}