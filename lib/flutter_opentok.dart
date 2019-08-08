import 'dart:async';

import 'package:flutter/services.dart';

class FlutterOpentok {
  static const MethodChannel _channel = const MethodChannel('flutter_opentok');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<void> openVideoScreen() async {
    await _channel.invokeMethod('openVideoScreen');
  }

  static Future<void> showAlertDialog() async {
    await _channel.invokeMethod('showAlertDialog');
  }
}
