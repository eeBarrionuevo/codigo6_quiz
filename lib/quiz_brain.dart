import 'package:codigo6_quiz/question.dart';

class QuizBrain {
  List<Question> _questions = [
    Question(questionText: "¿He dormido 8 horas?", questionAnswer: false),
    Question(questionText: "¿La tierra es plana?", questionAnswer: false),
    Question(questionText: "¿El hombre fue a la luna?", questionAnswer: true),
    Question(questionText: "¿Ella me quiere?", questionAnswer: false),
    Question(questionText: "¿He almozado hoy día?", questionAnswer: true),
  ];

  int questionNumber = 0;

  //Función que devuelva el texto de una pregunta de acuerdo a su posición
  // obtenerTextoPregunta() {

  // }
  String getQuestionText() {
    return _questions[questionNumber].questionText;
  }

  //Función que devuelva la respuesta de una pregunta de acuerdo a su posición

  bool getQuestionAnswer() {
    return _questions[questionNumber].questionAnswer;
  }

  void nextQuestion() {
    questionNumber++;
  }

  bool isFinished() {
    if (questionNumber >= _questions.length - 1) {
      return true;
    }
    return false;
  }
}
