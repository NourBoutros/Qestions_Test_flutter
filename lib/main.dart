import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import 'quiz.dart';
import 'result.dart';

// void main(){
// runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp>{
  final _questions = const [
    {'questionText':'What\'s your favourite color?' ,
      'answers' :[
        {'text':'Black', 'score': 10},
        {'text':'Red', 'score': 10},
        {'text':'Blue', 'score': 15},
        {'text':'Green', 'score': 2}
        ],
    },

    {'questionText':'What\'s your favourite animal?',
      'answers' :[
        {'text':'Rabbit', 'score': 7},
        {'text':'Snake', 'score': 1},
        {'text':'Elephant', 'score': 10},
        {'text':'Lion', 'score': 9}
        ],
    },

    {'questionText':'Who\'s your favourite instructor?',
      'answers' :[
        {'text':'Max', 'score': 6},
        {'text':'Dora', 'score': 2},
        {'text':'Nour', 'score': 10},
        {'text':'Lina', 'score': 1}],
    },

  ]; //list of strings

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });

  }
  void _answerQuestion(int score){ //function
   _totalScore +=  score;
    setState(() {
      _questionIndex = _questionIndex + 1 ;
    });

    print(_questionIndex);
    if(_questionIndex < _questions.length ){
      print("We have more questions");
    }else{
      print("no more questions");
    }
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
        )
            : Result(_totalScore, _resetQuiz) ,
      ),
    );
  }
}
