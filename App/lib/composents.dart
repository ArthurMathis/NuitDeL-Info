import 'dart:convert';
import 'package:flutter/services.dart';

class Question {
  int id;
  String question;
  bool reponse;
  String explication;

  Question(this.id, this.question, this.reponse, this.explication);

  // Méthode utilitaire pour créer une instance de Question à partir d'un Map
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      json['id'] as int,
      json['question'] as String,
      json['reponse'] as bool,
      json['explication'] as String,
    );
  }

  // Convertir une instance de Question en Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'reponse': reponse,
      'explication': explication,
    };
  }
}

Future<List<Question>> chargerQuestions() async {
  // Charger le contenu du fichier JSON
  String data = await rootBundle.loadString('assets/questions.json');

  // Convertir la chaîne JSON en une liste dynamique (List<dynamic>)
  List<dynamic> jsonList = json.decode(data);

  // Convertir la liste dynamique en une liste de Questions
  List<Question> questions = jsonList.map((json) {
    return Question.fromJson(json); // Utilise la méthode fromJson de la classe Question
  }).toList();

  return questions;
}

String affiche(Question c){
  String res = c.question;
  return res;
} 
