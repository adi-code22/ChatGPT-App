import 'package:flutter/material.dart';

import 'package:chatgpt_app/views/homescreen.dart';
import 'package:chatgpt_app/views/market.dart';
import 'package:chatgpt_app/views/speakNative.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        focusColor: Color.fromARGB(255, 138, 202, 255),
        hoverColor: Color.fromARGB(255, 55, 78, 142),
        primaryColorLight: Color(0xff3e97c9),
        primaryColor: Color(0xff233f8e),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
