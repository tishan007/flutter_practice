import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice/pages/file_upload.dart';
import 'package:flutter_practice/pages/popup_radiolisttile.dart';
import 'package:flutter_practice/pages/wifi_connection.dart';
import 'package:system_settings/system_settings.dart';
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

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      //developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });

    if((_connectionStatus.toString().contains("none"))) {
      return showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => new AlertDialog(
            content: Text("Please check your internet"),
            actions: <Widget>[
              FlatButton(
                child: Text('Go to Settings'),
                onPressed: () {
                  SystemSettings.system();
                },
              ),
              FlatButton(
                child: Text('Close me!'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          )
      );
    }

  }

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
            //child: FileUpload(),
            child: Text('Connection Status: ${_connectionStatus.toString()}'),
        ),
      ),
    );
  }




}

