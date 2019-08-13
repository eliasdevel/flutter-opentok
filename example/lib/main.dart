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
        apiKey: "46364972",
        sessionId:
            "1_MX40NjM2NDk3Mn5-MTU2NTY4NTE1NzkyNn5WM2owdGFhSm1KaE01RVlqN1ZmVFluanl-fg",
        token:
            "T1==cGFydG5lcl9pZD00NjM2NDk3MiZzaWc9Yjg1N2FmOWZkOWY1OWZjNGI3MTJiZjM5Zjk5YzdiNzdkNmY0MDA1NDpzZXNzaW9uX2lkPTFfTVg0ME5qTTJORGszTW41LU1UVTJOVFk0TlRFMU56a3lObjVXTTJvd2RHRmhTbTFLYUUwMVJWbHFOMVptVkZsdWFubC1mZyZjcmVhdGVfdGltZT0xNTY1Njg1MTc4Jm5vbmNlPTAuODU0NDg0ODI3Nzk3MDQzNiZyb2xlPXB1Ymxpc2hlciZleHBpcmVfdGltZT0xNTY4Mjc3MTc4JmluaXRpYWxfbGF5b3V0X2NsYXNzX2xpc3Q9");
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
