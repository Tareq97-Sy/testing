import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/test_page.dart';
import 'package:flutter_application_1/sample_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: TestPage(),
        ));
  }
}
