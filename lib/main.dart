import 'package:flutter/material.dart';
import 'package:network/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Network Demo',
      home: HomePage(),
      routes: {HomePage.id: (context) => HomePage()},
    );
  }
}
