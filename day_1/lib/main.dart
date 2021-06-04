import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> restaurants = ['Banh My', 'Yen Mach', 'Khoai Lang','Banh My Thit Nuong','Banh My Ga'];

   int currentIndex = 0;

  void getIndex() {
    final random = Random();
    final index = random.nextInt(restaurants.length);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'What do you want to eat today ?',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                restaurants[currentIndex],
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              IconButton(
                  onPressed: () {
                    getIndex();
                  },
                  icon: Icon(
                    Icons.catching_pokemon,
                    color: Colors.black,
                    size: 50,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
