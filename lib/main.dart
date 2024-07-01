import 'package:flutter/material.dart';
import 'package:flutter_ui_exercise/ui/grid_view.dart';
import 'package:flutter_ui_exercise/ui/list_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ListViewUI());
  }
}
