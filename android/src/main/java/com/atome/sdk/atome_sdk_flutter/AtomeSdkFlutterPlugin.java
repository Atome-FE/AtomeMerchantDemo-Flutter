package com.atome.sdk.atome_sdk_flutter;

import androidx.annotation.NonNull;

import com.atome.sdk.AtomeSDK;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * AtomeSdkFlutterPlugin
 */
public class AtomeSdkFlutterPlugin implements FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "atome_sdk_flutter");
        channel.setMethodCallHandler(this);
        AtomeSDK.getInstance().init(flutterPluginBinding.getApplicationContext());
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("isAtomeInstalled")) {
            result.success(AtomeSDK.getInstance().isAtomeInstalled());
        } else if (call.method.equals("handleUrl")) {
            Object argument = call.argument("url");
            if (argument instanceof String) {
                AtomeSDK.getInstance().handleUrl((String) argument);
                result.success(true);
            } else {
                result.success(false);
            }
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}
