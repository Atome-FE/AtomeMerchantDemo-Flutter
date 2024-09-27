import Flutter
import UIKit
import AtomeSDK

public class AtomeSdkFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "atome_sdk_flutter", binaryMessenger: registrar.messenger())
    let instance = AtomeSdkFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if(call.method == "isAtomeInstalled"){
          result(AtomeManager.shared().isAtomeInstalled())
      }else if(call.method == "handleUrl"){
          let arguments = call.arguments as? [String: Any] ?? [String: Any]()
          let url = arguments["url"] as? String
          if let urlString = arguments["url"] as? String, let url = URL(string: urlString) {
              AtomeManager.shared().handPaymentURL(url)
              result(true)
          } else {
              result(false)
          }
      } else{
        result(FlutterMethodNotImplemented);
      }
  }
}
