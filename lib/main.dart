import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/file_upload.dart';
import 'package:flutter_practice/pages/popup_radiolisttile.dart';
import 'package:flutter_practice/pages/wifi_connection.dart';
import 'package:toast/toast.dart';
import 'package:wifi_connection/WifiConnection.dart';

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
        //resizeToAvoidBottomPadding: false,      //for web part it should be commented
        appBar: AppBar(
          centerTitle: true,
          title: Text("Flutter"),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
            //child: PopUpRadioListTile(),
            //child: WifiConnectionPage(),
            child: FileUpload(),
        ),
      ),
    );
  }




}

