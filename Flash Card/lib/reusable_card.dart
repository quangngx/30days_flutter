import 'package:day_4/shared/app_color.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String content;
  const ReusableCard({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: AppColor.black,
      color: AppColor.lightBlue,
      child: Center(
        child: Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: AppColor.darkBlue),
        ),
      ),
    );
  }
}
