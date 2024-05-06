import 'dart:async';

import 'package:bfix_learning/no_internet.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  final String userType;
  WebViewApp({Key? key, required this.userType}) : super(key: key);

  @override
  _WebViewAppState createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;
  late StreamSubscription subscription;
  var isDeviceConnected = false;

  var _user_type;
  var url = "https://ambutacker.in";

  @override
  void initState() {
    super.initState();
    _user_type = widget.userType;
    if(_user_type == "user"){
      url = "https://ambutracker.in";
    }else if(_user_type == "driver"){
      url = "https://ambutracker.in/driver";
    }else if(_user_type == "hospital"){
      url = "https://ambutracker.in/hospital";
    }
    _preventScreenshot();
    controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (error) {
            if (error.errorType == WebResourceErrorType.hostLookup) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => noInternet()));
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    getConnectivity();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => noInternet()));
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}

Future<void> _preventScreenshot() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}
