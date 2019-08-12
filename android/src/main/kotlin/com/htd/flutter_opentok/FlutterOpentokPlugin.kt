package com.htd.flutter_opentok

import android.app.Activity;
import android.content.Intent
import androidx.core.app.ActivityCompat.startActivity
import androidx.core.app.ActivityCompat.startActivityForResult
import androidx.core.content.ContextCompat

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
    } else {
      result.notImplemented()
    }
  }
}
