import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoadUpdates extends StatefulWidget {
  @override
  _LoadUpdatesState createState() => _LoadUpdatesState();
}

class _LoadUpdatesState extends State<LoadUpdates> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://m.facebook.com/OHOGujaratiOTT/',
    );
  }
}



