import 'dart:async';

import 'package:flutter/services.dart';

class FlutterOpentok {
  static const MethodChannel _channel = const MethodChannel('flutter_opentok');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get openVideoScreen async {
    final String message = await _channel.invokeMethod('openVideoScreen');
    return message;
  }

  static Future<void> showAlertDialog() async {
    await _channel.invokeMethod('showAlertDialog');
  }
}
