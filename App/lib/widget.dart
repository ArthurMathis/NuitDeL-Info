import 'package:flutter/material.dart';
import 'dart:developer';
import 'composents.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final Future<List<Question>> questions = chargerQuestions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Question>>(
          future: questions,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Indicateur de chargement en cours
            } else if (snapshot.hasError) {
              return Text('Erreur de chargement'); // Affiche en cas d'erreur
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('Aucune question trouvée'); // Aucune question dans la liste
            } else {
              return Text(affiche(snapshot.data![0])); // Affiche la première question
            }
          },
        )
      ),
    );
  }
}