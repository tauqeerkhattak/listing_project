import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Data {
  static Color primaryColor = Colors.blueAccent;
  static Color secondaryColor = Colors.white;

  static List <IconData> dummyIcons = [
    CupertinoIcons.lightbulb,
    CupertinoIcons.double_music_note,
    CupertinoIcons.tv,
    Icons.fastfood_outlined,
    CupertinoIcons.airplane,
    Icons.gesture,
  ];

  static List <String> dummyCategories = [
    'New ideas',
    'Music',
    'Programming',
    'Cooking',
    'Transport',
    'Art',
  ];

  static List <Color> dummyColors = [
    Colors.orangeAccent,
    Colors.lightBlue,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.teal,
    Colors.redAccent,
  ];
}