import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listing_project/Data/data.dart';
import 'package:listing_project/Screens/home.dart';

void main() {
  SystemUiOverlayStyle(
    statusBarColor: Data.primaryColor,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}