import 'package:codigo6_quiz/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuizBrain mandarina = QuizBrain();
  List<Icon> scoreKeeper = [];

  void checkQuestion(bool type) {
    print("sdsada");
    if (mandarina.isFinished() == true) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "El quiz finalizó!",
        desc: "Quires iniciar nuevamente?",
        buttons: [
          DialogButton(
            child: Text(
              "Reiniciar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              mandarina.restart();
              scoreKeeper.clear();
              Navigator.pop(context);
              setState(() {});
            },
            width: 120,
          )
        ],
      ).show();
    } else {
      bool correctAnswer = mandarina.getQuestionAnswer();
      if (correctAnswer == type) {
        //Si la respuesta correcta es verdadera
        //Se agrega un icono a la lista de respuestas
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        //Si la respuesta correcta es falsa
        //Se agrega un icono de error a la lista de respuestas
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      setState(() {});
      mandarina.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2d42),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  //mandarina.questions[questionNumber].questionText,
                  mandarina.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  checkQuestion(true);
                },
                color: Color(0xff3bceac),
                child: Text(
                  "Verdadero",
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  checkQuestion(false);
                },
                color: Color(0xffff6b6b),
                child: Text(
                  "Falso",
                ),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
