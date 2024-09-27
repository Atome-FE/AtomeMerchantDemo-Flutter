
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'atome_sdk_flutter_method_channel.dart';

abstract class AtomeSdkFlutterPlatform extends PlatformInterface {
  /// Constructs a AtomeSdkFlutterPlatform.
  AtomeSdkFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static AtomeSdkFlutterPlatform _instance = MethodChannelAtomeSdkFlutter();

  /// The default instance of [AtomeSdkFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelAtomeSdkFlutter].
  static AtomeSdkFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AtomeSdkFlutterPlatform] when
  /// they register themselves.
  static set instance(AtomeSdkFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> isAtomeInstalled() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> handleUrl(String url) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
