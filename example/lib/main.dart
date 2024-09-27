import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:atome_sdk_flutter/atome_sdk_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isAtomeInstalled = false;
  final _atomeSdkFlutterPlugin = AtomeSdkFlutter();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool isAtomeInstalled;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      isAtomeInstalled =
          await _atomeSdkFlutterPlugin.isAtomeInstalled() ?? false;
    } on PlatformException {
      isAtomeInstalled = false;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _isAtomeInstalled = isAtomeInstalled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('Atome install Status: $_isAtomeInstalled\n'),
          MaterialButton(
            color: Colors.yellow,
            onPressed: () async {
              //paymentUrl
              await _atomeSdkFlutterPlugin.handleUrl("https://xxx");
            },
            child: const Text('Open Atome'),
          ),
        ])),
      ),
    );
  }
}
