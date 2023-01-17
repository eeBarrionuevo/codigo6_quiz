import 'package:codigo6_quiz/quiz_brain.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuizBrain mandarina = QuizBrain();

  // List<String> questions = [
  //   "¿He dormido 8 horas?", //false
  //   "¿La tierra es plana?", //false
  //   "¿El hombre fue a la luna?", //true
  //   "¿Ella me quiere?", //false
  //   "¿He almozado hoy día?" //true
  // ];

  // List<bool> answers = [
  //   false,
  //   false,
  //   true,
  //   false,
  //   true,
  // ];

  List<Icon> scoreKeeper = [];

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
          // SizedBox(
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     child: Text(
          //       "Hola",
          //     ),
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  //Obtenemos la respuesta correcta de la pregunta
                  // bool correctAnswer =
                  //     mandarina.questions[questionNumber].questionAnswer;

                  bool correctAnswer = mandarina.getQuestionAnswer();

                  //Comparamos la respuesta correcta con el valor verdaddero
                  if (correctAnswer == true) {
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
                  //Se redibuja el widget - Se ejecuta el método build
                  setState(() {});
                  //El valor del contador aumenta en uno
                  mandarina.nextQuestion();
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
                  //Obtenemos la respuesta correcta de la pregunta

                  bool correctAnswer = mandarina.getQuestionAnswer();

                  //Comparamos la respuesta correcta con el valor verdaddero
                  if (correctAnswer == false) {
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
                  //Se redibuja el widget - Se ejecuta el método build
                  setState(() {});
                  //El valor del contador aumenta en uno
                  mandarina.nextQuestion();
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
