import 'package:flutter/material.dart';
import 'package:flutter_html_editor/basiccode.dart';

import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import 'mydrawer.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  TextEditingController htmlTextController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    htmlTextController.text = htmlBasicCode;
  }

  String currentText = htmlBasicCode;
  late WebViewPlusController _controller;
  double _height = 1000;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  htmlTextController.text = htmlBasicCode;
                },
                icon: const Icon(Icons.refresh))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.code),
                child: Text('HTML Code'),
              ),
              Tab(
                icon: Icon(
                  Icons.smart_display_outlined,
                ),
                child: Text('View Output'),
              ),
            ],
          ),
          title: const Text('Free HTML Editor'),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (val) {
                    setState(() {
                      currentText = val;
                    });
                  },
                  controller: htmlTextController,
                  decoration: const InputDecoration(
                    hintText: "Insert your html code",
                  ),
                  scrollPadding: const EdgeInsets.all(20.0),
                  keyboardType: TextInputType.multiline,
                  maxLines: 99999,
                  autofocus: true,
                ),
              ),
            ),
            ListView(
              children: [
                SizedBox(
                  height: _height,
                  child: WebViewPlus(
                    javascriptChannels: null,
                    onWebViewCreated: (controller) {
                      controller.loadString(currentText);
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
          ],
        ),
      ),
    );
  }
}
