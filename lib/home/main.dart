import 'package:flutter/material.dart';
import 'package:management/screen/screen_home.dart';

void main() => runApp(money());

class money extends StatelessWidget {
  const money({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: screenhome(),
    );
  }
}
