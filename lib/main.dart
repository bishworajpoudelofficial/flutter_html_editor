import 'package:flutter/material.dart';
import 'package:flutter_html_editor/aboutus_screen.dart';


import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Free HTML Editor",
      theme: ThemeData(
          primaryColor: const Color(0xFFF16528),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFF16528),
          )),
      initialRoute: '/',
      routes: {
        HomePage.routeName: (ctx) => HomePage(),
        AboutUsScreen.routeName: (ctx) => AboutUsScreen(),
      },
    );
  }
}
