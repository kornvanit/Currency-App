import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travel_rate/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Rate',
      home: Home(),
    );
  }
}
