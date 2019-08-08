import Flutter
import UIKit

public class SwiftFlutterOpentokPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_opentok", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterOpentokPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "getPlatformVersion") {
      result("iOS " + UIDevice.current.systemVersion)
    } else if (call.method == "showAlertDialog") {
      DispatchQueue.main.async {
        let alert = UIAlertController(title: "Alert", message: "Hi, My name is flutter", preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil);
      }
    }
    else if (call.method == "openVideoScreen") {
      // self?.presentVideoChatScreen(result: result)
    }
  }

  // func presentVideoChatScreen(result: @escaping FlutterResult) {
  //   let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //   let identifier = "VideoChatNavigationViewController"
  //   let navVC = storyboard.instantiateViewController(withIdentifier: identifier) as! UINavigationController
  //   let videoChatVC = navVC.viewControllers.first as! VideoChatViewController
  //   videoChatVC.onCloseTap = { callDuration in
  //       result("\(callDuration) seconds")
  //   }
  //   window.rootViewController?.present(navVC, animated: true, completion: nil)
  // }
}
