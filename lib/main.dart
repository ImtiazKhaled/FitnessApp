import 'package:flutter/material.dart';
import 'Pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData(
  
        backgroundColor: Color(0xff0087a2),
        buttonColor: Color(0xff0087a2),
        accentColor: Color(0xfffaf2f2), 
      
      ),
      home: Login(),
     );
  }
}

