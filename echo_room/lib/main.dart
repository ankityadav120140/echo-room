import 'package:echo_room/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Echo Room',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const home(),
    );
  }
}
