import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var scoreText = resultScore.toString() + "/10\n";
    var resultText = scoreText;
    if (resultScore >= 8) {
      resultText += 'Excellent!';
    } else if (resultScore >= 5) {
      resultText += 'Great!';
    } else if (resultScore < 5) {
      resultText += 'Good! Can do better.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        TextButton(onPressed: resetHandler, child: Text('Restart Quiz!'))
      ]),
    );
  }
}
