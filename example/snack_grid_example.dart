
import 'package:flutter/material.dart';
import 'package:snack_grid_menu/grid_view.dart';
import 'package:snack_grid_menu/menu_item.dart';

void main() {
runApp(ContohSnackGrid());
}

class ContohSnackGrid extends StatefulWidget {
  ContohSnackGrid({Key key}) : super(key: key);

  _ContohSnackGridState createState() => _ContohSnackGridState();
}

class _ContohSnackGridState extends State<ContohSnackGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SnackGridMenu(itemList: <MenuItem>[
            MenuItem(title: 'manu1', imagePath: null),
            MenuItem(title: 'manu2', imagePath: null),
            MenuItem(title: 'manu3', imagePath: null),
            MenuItem(title: 'manu4', imagePath: null),
            MenuItem(title: 'manu5', imagePath: null),
            MenuItem(title: 'manu6', imagePath: null),
            MenuItem(title: 'manu7', imagePath: null),
          ],)
    );
  }
}