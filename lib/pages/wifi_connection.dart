import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:wifi_connection/WifiConnection.dart';
import 'package:wifi_connection/WifiInfo.dart';


class WifiConnectionPage extends StatefulWidget {
  @override
  _WifiConnectionPageState createState() => _WifiConnectionPageState();
}

class _WifiConnectionPageState extends State<WifiConnectionPage> {
  WifiInfo _wifiInfo = WifiInfo();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    WifiInfo wifiInfo;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      wifiInfo = await WifiConnection.wifiInfo;
    } on PlatformException {
      wifiInfo = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _wifiInfo = wifiInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('SSID: ${_wifiInfo?.ssid}\n'),
                Text('BSSID: ${_wifiInfo?.bssid}\n'),
                Text('IP: ${_wifiInfo?.ipAddress}\n'),
                Text('MAC Address: ${_wifiInfo?.macAddress}\n'),
                Text('Link Speed: ${_wifiInfo?.linkSpeed}\n'),
                Text('Signal Strength: ${_wifiInfo?.signalStrength}\n'),
                Text('Frequency: ${_wifiInfo?.frequency}\n'),
                Text('Channel: ${_wifiInfo?.channel}\n'),
                Text('Network Id: ${_wifiInfo?.networkId}\n'),
                Text('IsHiddenSSID: ${_wifiInfo?.isHiddenSSID}\n'),
                Text('Router IP: ${_wifiInfo?.routerIp}\n'),
                TextButton(
                    onPressed: () {
                      initPlatformState();
                    },
                    child: Text('Refresh'))
              ]),
        ),
      ),
    );
  }
}
