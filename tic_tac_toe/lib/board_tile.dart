import 'package:flutter/material.dart';

class BoardTile extends StatelessWidget {
  late double? dimension;

  BoardTile({Key? key, this.dimension }) : super(key: key);

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
