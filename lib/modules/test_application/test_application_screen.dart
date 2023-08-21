import 'dart:math';

import 'package:flutter/material.dart';

class TestApplicationScreen extends StatefulWidget {

  @override
  State<TestApplicationScreen> createState() => _TestApplicationScreenState();
}

class _TestApplicationScreenState extends State<TestApplicationScreen> {

  Color _backgroundColor = Colors.white;

  void changeBackgroundColor() {
    Random random = Random();
    Color color = Color.fromARGB(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
    setState(() {
      _backgroundColor = color;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test Application',
        ),
      ),
      body: GestureDetector(
        onTap: changeBackgroundColor,
        child: Container(
          color: _backgroundColor,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hey there',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
