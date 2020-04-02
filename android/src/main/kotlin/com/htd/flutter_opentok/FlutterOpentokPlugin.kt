package com.htd.flutter_opentok

import android.app.Activity;
import android.content.Intent
import android.support.v4.app.ActivityCompat.startActivity
import android.support.v4.app.ActivityCompat.startActivityForResult
import android.support.v4.content.ContextCompat

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
//      startActivity(this.activity, Intent( this.activity, VideoActivity::class.java), null)
      this.activity.startActivityForResult(Intent( this.activity, VideoActivity::class.java), 300)
//      startActivityForResult(this.activity, Intent( this.activity, VideoActivity::class.java), 300, null)
    } else if (call.method == "setApiKey") {
      val key = call.argument<String>("key")
      OpenTokConfig.API_KEY = key.toString()
        // setApiKey( as String)
    } else if (call.method == "setApiToken") {
      val token = call.argument<String>("token")
      OpenTokConfig.TOKEN = token.toString()
    } else if (call.method == "setApiSessionId") {
      val sessionId = call.argument<String>("sessionId")
      OpenTokConfig.SESSION_ID = sessionId.toString()
    } else if (call.method == "setApiUrl") { 
      val url = call.argument<String>("url")
      OpenTokConfig.CHAT_SERVER_URL = url.toString()
    } else if (call.method == "showAlertDialog") { 
      
    } else {
      result.notImplemented()
    }
  }


}
