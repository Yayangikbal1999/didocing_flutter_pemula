import 'package:flutter/material.dart';
import 'package:wisata/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tempat wisata',
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      home: const MainScreen(),
    );
  }
}
