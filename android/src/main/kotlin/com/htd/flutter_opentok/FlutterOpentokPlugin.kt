package com.htd.flutter_opentok

import android.app.Activity
import android.content.Intent

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterOpentokPlugin: MethodCallHandler {
  private var activity: Activity;
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "flutter_opentok")
      channel.setMethodCallHandler(FlutterOpentokPlugin(registrar.activity()))
    }
  }

  constructor(activity: Activity) {
    this.activity = activity
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "openVideoScreen") {

      if (call.arguments == null) {
        result.error("arguments", "==", "null")
      }


      val args: List<String> = call.arguments as List<String>
      val apiKey: String = args[0]
      val token: String = args[1]
      val sessionId: String = args[2]
      val intent = Intent( this.activity, VideoActivity::class.java)
      intent.putExtra("apiKey", apiKey)
      intent.putExtra("token", token)
      intent.putExtra("sessionId", sessionId)
      this.activity.startActivityForResult(intent, 300)
    } else {
      result.notImplemented()
    }
  }
}
