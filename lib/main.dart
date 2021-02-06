import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print('Answer chosen');
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'questionText': 'What\'s your favourite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 7},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1},
        ]
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answers': [
          {'text': 'Rabbit', 'score': 10},
          {'text': 'Snake', 'score': 7},
          {'text': 'Dog', 'score': 3},
          {'text': 'Cat', 'score': 1},
        ]
      },
      {
        'questionText': 'Who\'s the Son of Sathian?',
        'answers': [
          {'text': 'Ashwin', 'score': 10},
          {'text': 'Ashwin', 'score': 10},
          {'text': 'Ashwin', 'score': 10},
          {'text': 'Ashwin', 'score': 10},
        ]
      },
    ];
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
            backgroundColor: Colors.blue,
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
