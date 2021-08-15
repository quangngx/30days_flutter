import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/board_tile.dart';
import 'package:tic_tac_toe/tile_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TileState tileState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [Image.asset('images/board.png'), _boardTiles()],
        ),
      ),
    );
  }

  Widget _boardTiles() {
    final boardDemension = MediaQuery.of(context).size.width;
    final tileDemension = boardDemension / 3;
    return Builder(
        builder: (context) => Container(
              height: boardDemension,
              width: boardDemension,
              child: Column(
                children: [
                  Row(
                    children: [
                      BoardTile(
                        dimension: tileDemension, 
                        tileState: ,
                      ),
                      BoardTile(
                        dimension: tileDemension,
                      ),
                      BoardTile(
                        dimension: tileDemension,
                      )
                    ],
                  ),
                ],
              ),
            ));
  }
}
