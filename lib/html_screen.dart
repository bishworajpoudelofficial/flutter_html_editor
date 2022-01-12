import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class HTMLScreen extends StatefulWidget {
  static const routeName = '/htmlscreen';

  final String content;
  HTMLScreen(this.content);

  @override
  _HTMLScreenState createState() => _HTMLScreenState();
}

class _HTMLScreenState extends State<HTMLScreen> {
  late WebViewPlusController _controller;
  double _height = 1000;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? ListView(
            children: [
              SizedBox(
                height: _height,
                child: WebViewPlus(
                  javascriptChannels: null,
                  onWebViewCreated: (controller) {
                    controller.loadString("${widget.content}");
                  },
                  onPageFinished: (url) {
                    _controller.getHeight().then((double height) {
                      print("Height: " + height.toString());
                      setState(() {
                        _height = height;
                      });
                    });
                  },
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              )
            ],
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
