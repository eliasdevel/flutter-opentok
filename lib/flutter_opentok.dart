import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FlutterOpentok {
  static const MethodChannel _channel = const MethodChannel('flutter_opentok');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> openVideoScreen({
    @required String apiKey,
    @required String token,
    @required String sessionId,
  }) async {
    await _channel.invokeMethod('openVideoScreen', [apiKey, token, sessionId]);
  }

  static Future<void> showAlertDialog() async {
    await _channel.invokeMethod('showAlertDialog');
  }
}
