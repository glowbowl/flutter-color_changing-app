import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Color App by Vlad Lyashko',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage() : super();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color changedColor = Colors.black;

  void changeColor() {
        setState(() {
          int randomColor = Random().nextInt(0xFFFFFF);
          int newColor = 0xFF000000 + randomColor;
          changedColor = Color(newColor);
          print('Tapped and changed color on $changedColor');
        });
      }

  @override
  Widget build(BuildContext context) {
      return 
        GestureDetector(
        child: Container(
          color: changedColor,
          alignment: Alignment.center,
          child: Text( 
            "Hey there!",
            style: Theme.of(context).textTheme.title.merge(TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 35)),
          ),
        ),
        onTap: () {changeColor();},
    );
  }
}
