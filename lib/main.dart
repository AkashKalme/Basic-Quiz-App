import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'What was Meta previously called?',
      'answers': [
        {'text': 'Facebook', 'score': 1},
        {'text': 'Google', 'score': 0},
        {'text': 'Yahoo', 'score': 0},
        {'text': 'Amazon Inc.', 'score': 0}
      ],
    },
    {
      'questionText': 'Which was the first search engine?',
      'answers': [
        {'text': 'Google', 'score': 0},
        {'text': 'Yahoo', 'score': 0},
        {'text': 'Bing', 'score': 0},
        {'text': 'Archie', 'score': 1}
      ],
    },
    {
      'questionText': 'How many times can you subtract 10 from 100?',
      'answers': [
        {'text': '1 time', 'score': 1},
        {'text': '10 times', 'score': 0},
        {'text': '9 times', 'score': 0},
        {'text': '5 times', 'score': 0}
      ],
    },
    {
      'questionText': 'Which one of the following is not a operating system?',
      'answers': [
        {'text': 'DOS', 'score': 0},
        {'text': 'C', 'score': 1},
        {'text': 'MAC', 'score': 0},
        {'text': 'Windows', 'score': 0}
      ],
    },
    {
      'questionText':
          'Key, Door, Lock, Room, Switch\nArrange the words given above in a meaningful sequence.',
      'answers': [
        {'text': '4, 2, 1, 5, 3', 'score': 0},
        {'text': '1, 3, 2, 4, 5', 'score': 1},
        {'text': '5, 1, 2, 4, 3', 'score': 0},
        {'text': '1, 2, 3, 5, 4', 'score': 0}
      ],
    },
    {
      'questionText': 'Who is the inventor and founder of www?',
      'answers': [
        {'text': 'Bill Gates', 'score': 0},
        {'text': 'Lee N. Fiyong', 'score': 0},
        {'text': 'N.Russell', 'score': 0},
        {'text': 'Tim Burners Lee', 'score': 1}
      ],
    },
    {
      'questionText':
          'How many times in a day, are the hands of a clock in straight line but opposite in direction?',
      'answers': [
        {'text': '12', 'score': 0},
        {'text': '48', 'score': 0},
        {'text': '24', 'score': 0},
        {'text': '22', 'score': 1}
      ],
    },
    {
      'questionText': 'What was the first computer virus known as?',
      'answers': [
        {'text': 'Rabbit', 'score': 0},
        {'text': 'Ransomware', 'score': 0},
        {'text': 'Creeper Virus', 'score': 1},
        {'text': 'SCA Virus', 'score': 0}
      ],
    },
    {
      'questionText':
          'Which of the following operating systems is produced by IBM?',
      'answers': [
        {'text': 'OS-2', 'score': 1},
        {'text': 'Windows', 'score': 0},
        {'text': 'DOS', 'score': 0},
        {'text': 'UNIX', 'score': 0}
      ],
    },
    {
      'questionText':
          'If\t1 1 1 1 = R\n\t2 2 2 2 = T\n\t3 3 3 3 = E\n\t4 4 4 4 = N\nThen\n\t5 5 5 5 = ?',
      'answers': [
        {'text': 'T', 'score': 0},
        {'text': 'X', 'score': 0},
        {'text': 'Z', 'score': 0},
        {'text': 'Y', 'score': 1}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = (_questionIndex + 1);
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions.');
    } else {
      print("Out of Questions.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
