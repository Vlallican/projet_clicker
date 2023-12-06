
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'inventaire.dart';

class Recette {
  final String nom;
  final String cout;
  final String gameplay;
  final String type;
  final String description;

  Recette({
    required this.nom,
    required this.cout,
    required this.gameplay,
    required this.type,
    required this.description,
  });

  factory Recette.fromJson(Map<String, dynamic> jsonData) {
    return Recette(
      nom: jsonData['nom'] as String,
      cout: jsonData['cout'] as String,
      gameplay: jsonData['gameplay'] as String,
      type: jsonData['type'] as String,
      description: jsonData['description'] as String,
    );
  }
}

class RecettesPage extends StatefulWidget {
  const RecettesPage({Key? key}) : super(key: key);

  @override
  _RecettesPageState createState() => _RecettesPageState();
}

class _RecettesPageState extends State<RecettesPage> {
  List<Recette> recettes = [];

  @override
  void initState() {
    super.initState();
    loadRecettes();
  }

  Future<void> loadRecettes() async {
    try {
      final String response = await rootBundle.loadString('lib/recettes.json');
      final data = await json.decode(response);
      setState(() {
        recettes = (data['recettes'] as List).map((i) => Recette.fromJson(i)).toList();
      });
    } catch (e) {
      print('Erreur de chargement des recettes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recettes'),
      ),
      body: ListView.builder(
        itemCount: recettes.length,
        itemBuilder: (BuildContext context, int index) {
          final recette = recettes[index];
          return Card(
            child: ListTile(
              title: Text(recette.nom ?? 'Nom inconnu'),
              subtitle: Text('${recette.description ?? 'Pas de description'}\nCoût: ${recette.cout ?? 'Coût inconnu'}'),
              trailing: ElevatedButton(
                onPressed: () {
                  Inventaire.ajouterRecette(recette.nom);
                }, // Le bouton est désactivé par défaut
                child: const Text('Produire'),
              ),
            ),
          );
        },
      ),
    );
  }
}
