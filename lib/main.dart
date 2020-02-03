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
      home: MyHomePage(title: 'Flutter Color App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

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

  Widget _buildAboutText() {
    return new RichText(
      text: new TextSpan(
        text: 'Simple Flutter Color Changin App developed by Vlad Lyashko as a test task for Solid Software.',
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('About App'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAboutText(),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Okay!'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: changedColor,
        centerTitle: true,
        // brightness: Brightness.dark,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: changedColor,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Test App',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Material(
                child: new RaisedButton(
                  child:ListTile(
                    leading: Icon(Icons.info),
                    title: Text('Information'),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => _buildAboutDialog(context),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: Container(
         child: GestureDetector(
          child: Container(
            color: changedColor,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: new Text( 
              "Hey there!",
              style: Theme.of(context).textTheme.title.merge(TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 35)),
            ),
          ),
        onTap: () {changeColor();},
        ),
      ),
    );
  }
}