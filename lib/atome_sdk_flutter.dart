import 'atome_sdk_flutter_platform_interface.dart';

class AtomeSdkFlutter {
  Future<bool?> isAtomeInstalled() {
    return AtomeSdkFlutterPlatform.instance.isAtomeInstalled();
  }

  Future<bool?> handleUrl(String url) {
    return AtomeSdkFlutterPlatform.instance.handleUrl(url);
  }
}
