import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../main.dart';

class WebViewScreen extends StatefulWidget {
  var url = "";
  var title = "";
  var hColor = "";

  WebViewScreen(url, title, hColor) {
    this.url = url;
    this.title = title;
    this.hColor = hColor;
  }

  @override
  WebViewScreenState createState() => WebViewScreenState(url, title, hColor);
}

class WebViewScreenState extends State<WebViewScreen> {
  var url = "";
  var title = "";
  var hColor = "";

  WebViewScreenState(url, title, hColor) {
    this.url = url;
    this.title = title;
    this.hColor = hColor;
  }

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor.fromHex(hColor),
          title: Text(title),
        ),
        body: SafeArea(
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController wc) {
              controller = wc;
            },
          ),
        ));
  }
}
