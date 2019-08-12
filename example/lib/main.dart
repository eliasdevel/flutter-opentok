import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_opentok/flutter_opentok.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterOpentok.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> _openAlert() async {
    await FlutterOpentok.openVideoScreen(
        apiKey: "46362752",
        sessionId:
            "1_MX40NjM2Mjc1Mn5-MTU2NTYxNDg3OTA3N35ZSHNPbmp5dGtRTEljYXFPS1AzVjlCemh-fg",
        token:
            "T1==cGFydG5lcl9pZD00NjM2Mjc1MiZzaWc9ODc4OTZlMGE2ZTliNjFhM2I4NGNjNWViZjY2Yzk1NmNkYTNmNDI3MTpzZXNzaW9uX2lkPTFfTVg0ME5qTTJNamMxTW41LU1UVTJOVFl4TkRnM09UQTNOMzVaU0hOUGJtcDVkR3RSVEVsallYRlBTMUF6VmpsQ2VtaC1mZyZjcmVhdGVfdGltZT0xNTY1NjE0ODgzJm5vbmNlPTAuODc3MTU2NTIwMTYxMTEwNSZyb2xlPXB1Ymxpc2hlciZleHBpcmVfdGltZT0xNTY1NjE4NDgzJmluaXRpYWxfbGF5b3V0X2NsYXNzX2xpc3Q9");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Text('Running on: $_platformVersion\n'),
            FloatingActionButton(
              onPressed: _openAlert,
              child: Text("Click me"),
            )
          ],
        )),
      ),
    );
  }
}
