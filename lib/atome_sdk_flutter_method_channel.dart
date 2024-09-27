import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'atome_sdk_flutter_platform_interface.dart';

/// An implementation of [AtomeSdkFlutterPlatform] that uses method channels.
class MethodChannelAtomeSdkFlutter extends AtomeSdkFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('atome_sdk_flutter');

  @override
  Future<bool?> isAtomeInstalled() async {
    final isAtomeInstalled =
        await methodChannel.invokeMethod<bool>('isAtomeInstalled');
    return isAtomeInstalled;
  }

  @override
  Future<bool?> handleUrl(String url) {
    final result = methodChannel.invokeMethod<bool>('handleUrl', <String, dynamic>{
      'url': url,
    });
    return result;
  }
}
