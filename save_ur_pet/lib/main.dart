import 'package:flutter/material.dart';
import 'package:save_ur_pet/views/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Save (ur) Pet',
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

