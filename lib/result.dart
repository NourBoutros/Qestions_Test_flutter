import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'you are awesome and innocent ';
    } else if (resultScore <= 12) {
      resultText = 'pretty likable ';
    } else if (resultScore <= 16) {
      resultText = 'you are ..... Strange ';
    } else {
      resultText = 'you are so bad ';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton( child: Text('Restart quiz',
            style: TextStyle(fontSize: 30), ),
            textColor: Colors.red,
            onPressed: resetQuiz,)
        ],
      ),
    );
  }
}
