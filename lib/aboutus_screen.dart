import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = '/about-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Thulo Html editor is developed for those who want to learn HTML from Mobile Phone. Coding from mobile is becoming need now.\n\nEmail: info@thulotechnology.com'),
          )
        ],
      ),
    );
  }
}