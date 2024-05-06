import 'package:bfix_learning/home.dart';
import 'package:bfix_learning/no_internet.dart';
import 'package:bfix_learning/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Splash(),
    ),
  );
}
