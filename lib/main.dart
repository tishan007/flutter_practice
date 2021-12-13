import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/popup_radiolisttile.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Flutter"),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
            child: PopUpRadioListTile(),
        ),
      ),
    );
  }




}

