import 'package:flutter/material.dart';
import 'package:myfood_app/screens/login.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pinkAccent),
        
      
      home: Login(),
    );
  }
}

