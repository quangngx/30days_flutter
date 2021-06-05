import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _fontSize = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.done,
                style: TextStyle(
                  fontSize: _fontSize,
                ),
                maxLines: null,
              ),
            ),
            Slider(value: _fontSize, onChanged: (newSize){
              setState(() {
                _fontSize = newSize;
              });
            },
            max: 60,
            min: 20,
            )
          ],
        ),
      ),
    );
  }
}
