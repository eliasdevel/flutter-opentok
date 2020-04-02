import 'dart:async';

import 'package:flutter/services.dart';

class FlutterOpentok {
  static const MethodChannel _channel = const MethodChannel('flutter_opentok');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> openVideoScreen() async {
    await _channel.invokeMethod('openVideoScreen');
  }

  static Future<void> showAlertDialog() async {
    await _channel.invokeMethod('showAlertDialog');
  }

  static Future<void> setApiKey(String key) async {
    await _channel.invokeMethod('setApiKey', {'key': key});
  }

  static Future<void> setApiToken(String token) async {
    await _channel.invokeMethod('setApiToken',{'token': token});
  }

  static Future<void> setApiSessionId(String sessionId) async {
    await _channel.invokeMethod('setApiSessionId', {'sessionId': sessionId});
  }

  static Future<void> setApiUrl(String url) async {
    await _channel.invokeMethod('setApiUrl', {'url': url});
  }

 

}
