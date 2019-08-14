import 'package:flutter/material.dart';

class MenuItem {
  String title;
  String imagePath;
  Color color;
  VoidCallback onTap;

  MenuItem(
      {@required this.title, @required this.imagePath, this.color, this.onTap});
}
