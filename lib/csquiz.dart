import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class CsQuiz extends StatelessWidget {
  final List<Map> _questions;
  final int _questionIndex;
  final Function _selectHandler;

  CsQuiz(this._questions, this._questionIndex, this._selectHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Question(_questions[_questionIndex]['questionText']),
        ...(_questions[_questionIndex]['choices'] as List<String>).map((ch) {
          return Answer(() {
            int choiceIndex =
                (_questions[_questionIndex]['choices'] as List<String>)
                    .indexOf(ch);
            int currentScore = (_questions[_questionIndex]['scores']
                as List<int>)[choiceIndex];

            _selectHandler(currentScore);
          }, ch);
        }).toList(),
      ],
    );
  }
}

/*
Answer(() {
          _selectHandler(
              (_questions[_questionIndex]['scores'] as List<int>)[0]);
        }, (_questions[_questionIndex]['choices'] as List<String>)[0]),
        Answer(() {
          _selectHandler(
              (_questions[_questionIndex]['scores'] as List<int>)[1]);
        }, (_questions[_questionIndex]['choices'] as List<String>)[1]),
        Answer(() {
          _selectHandler(
              (_questions[_questionIndex]['scores'] as List<int>)[2]);
        }, (_questions[_questionIndex]['choices'] as List<String>)[2]),
        Answer(() {
          _selectHandler(
              (_questions[_questionIndex]['scores'] as List<int>)[3]);
        }, (_questions[_questionIndex]['choices'] as List<String>)[3]),
*/
