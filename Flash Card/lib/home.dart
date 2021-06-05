import 'package:day_4/flash_card.dart';
import 'package:day_4/reusable_card.dart';
import 'package:day_4/shared/app_color.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<FlashCard> _flashCard = [
    FlashCard(question: 'Question 1', answer: 'Answer 1'),
    FlashCard(question: 'Question 2', answer: 'Answer 2'),
    FlashCard(question: 'Question 3', answer: 'Answer 3'),
    FlashCard(question: 'Question 4', answer: 'Answer 4'),
    FlashCard(question: 'Question 5', answer: 'Answer 5'),
    FlashCard(question: 'Question 6', answer: 'Answer 6')
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: FlipCard(
                  front:
                      ReusableCard(content: _flashCard[_currentIndex].question),
                  back: ReusableCard(content: _flashCard[_currentIndex].answer),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                      onPressed: prevCard, child: Icon(Icons.chevron_left)),
                  OutlinedButton(
                      onPressed: nextCard, child: Icon(Icons.chevron_right))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void nextCard() {
    setState(() {
      _currentIndex =
          _currentIndex + 1 < _flashCard.length ? _currentIndex +1 : 0;
    });
  }

  void prevCard() {
    setState(() {
      _currentIndex =
          _currentIndex - 1 >= 0 ? _currentIndex-1 : _flashCard.length-1;
    });
  }
}
