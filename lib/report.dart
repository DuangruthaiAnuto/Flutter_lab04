import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  final int totalScore;

  Report(this.totalScore);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amberAccent[100],
        body: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'images/2.png',
                height: 175,
                width: 300,
              ),
              Text(
                "Your Score: $totalScore",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[900],
                ),
              ),
              Image.asset(
                'images/1.png',
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
