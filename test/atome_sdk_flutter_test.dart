import 'package:flutter_test/flutter_test.dart';
import 'package:atome_sdk_flutter/atome_sdk_flutter.dart';
import 'package:atome_sdk_flutter/atome_sdk_flutter_platform_interface.dart';
import 'package:atome_sdk_flutter/atome_sdk_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAtomeSdkFlutterPlatform
    with MockPlatformInterfaceMixin
    implements AtomeSdkFlutterPlatform {
  @override
  Future<bool> handleUrl(String url) {
    return Future.value(true);
  }

  @override
  Future<bool?> isAtomeInstalled() {
    return Future.value(true);
  }
}

void main() {
  final AtomeSdkFlutterPlatform initialPlatform =
      AtomeSdkFlutterPlatform.instance;

  test('$MethodChannelAtomeSdkFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAtomeSdkFlutter>());
  });

  test('getPlatformVersion', () async {
    AtomeSdkFlutter atomeSdkFlutterPlugin = AtomeSdkFlutter();
    MockAtomeSdkFlutterPlatform fakePlatform = MockAtomeSdkFlutterPlatform();
    AtomeSdkFlutterPlatform.instance = fakePlatform;

    expect(await atomeSdkFlutterPlugin.isAtomeInstalled(), true);
  });
}
