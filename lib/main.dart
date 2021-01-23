import 'package:flutter/material.dart';
import 'package:flutter_04/csquiz.dart';
import 'csquiz.dart';
import 'report.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComSci Quiz',
      home: ComSciQuiz(title: 'How much do you know ComSci?'),
    );
  }
}

class ComSciQuiz extends StatefulWidget {
  ComSciQuiz({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ComSciQuizState createState() => _ComSciQuizState();
}

class _ComSciQuizState extends State<ComSciQuiz> {
  int questionIndex = 0;
  int choiceIndex = 0;
  int totalScore = 0;

  final _questions = const [
    {
      'questionText': "สาขาที่นักศึกษาชอบเรียน?",
      'choices': ["วิทยาการคอมพิวเตอร์", "Computer Science", "ComSci", "Cs"],
      'scores': [5, 4, 3, 2]
    },
    {
      'questionText': "ภาษาโปรแกรมที่นักศึกษาชอบ?",
      'choices': ["HTML", "C++", "SQL", "Java"],
      'scores': [1, 5, 3, 4]
    },
    {
      'questionText': "วิชาที่คิดว่ายากที่สุด?",
      'choices': ["แคลคูลัส", "Flutter", "โครงสร้างข้อมูล", "โครงสร้างดิสครีต"],
      'scores': [5, 4, 3, 5]
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      questionIndex = questionIndex + 1;
      totalScore = totalScore + score;
      //if (questionIndex >= _questions.length) {
      // questionIndex = 0;
      //totalScore = 0;
      //}
      print("Question : $questionIndex");
      print("Total Score : $totalScore");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: (questionIndex < _questions.length)
              ? CsQuiz(_questions, questionIndex, _answerQuestion)
              : Report(totalScore)),
    );
  }
}
