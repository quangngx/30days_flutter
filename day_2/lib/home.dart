import 'package:day_2/shared/app_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  String tip = '' ;
  List<bool> _isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tip,
              style: TextStyle(color: AppColor.darkBlue, fontSize: 40),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: 60,
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: '\$100.00'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            ToggleButtons(
              children: [
                Container(alignment: Alignment.center, width: 60, child: Text('10%')),
                Container(alignment: Alignment.center, width: 60, child: Text('15%')),
                Container(alignment: Alignment.center, width: 60, child: Text('20%'))
              ],
              renderBorder: false,
              isSelected: _isSelected,
              onPressed: updateSelection,
              color: AppColor.darkBlue,
              textStyle: TextStyle(fontSize: 20),
              selectedColor: AppColor.red,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: calcTip,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor.darkBlue,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Calculate Tips',
                  style: TextStyle(fontSize: 24, color: AppColor.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void updateSelection(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _isSelected.length; i++) {
        _isSelected[i] = selectedIndex == i; 
      }
    });
  }

  void calcTip() {
      final totalAmount = double.parse(_controller.text);
      final selectedIndex = _isSelected.indexWhere((element) => element);
      final tipPercentage = [0.1, 0.15, 0.2][selectedIndex];

      final tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);

      setState(() {
        tip = '\$$tipTotal';
      });
  }
}
