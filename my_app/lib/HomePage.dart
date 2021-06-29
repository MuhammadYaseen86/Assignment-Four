import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'BMI Calculator',
            style: new TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
