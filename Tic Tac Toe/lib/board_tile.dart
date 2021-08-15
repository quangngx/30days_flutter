import 'package:flutter/material.dart';
import 'package:tic_tac_toe/tile_model.dart';

class BoardTile extends StatelessWidget {
  late double dimension;
  late TileState tileState;

  BoardTile({Key? key, required this.dimension,required this.tileState }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: dimension,
        height: dimension,
        child: Image.asset('images/x.png'),
      ),
    );
  }
}
