import 'package:flutter/material.dart';

class Ressources extends StatefulWidget {
  final Color couleur;
  final String nom;
  final Map<String, int> resources;

  const Ressources({Key? key, required this.couleur, required this.nom, required this.resources}) : super(key: key);

  @override
  _RessourceState createState() => _RessourceState();
}

class _RessourceState extends State<Ressources> {
  void _incrementerRessource() {
    setState(() {
      RessourcesManager().incrementerRessource(widget.nom);
    });
  }

  // Affichage des ressources.
  @override
  Widget build(BuildContext context) {
    final int quantite = RessourcesManager().resources[widget.nom] ?? 0;
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.couleur,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.nom,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'Quantité: ${widget.resources[widget.nom] ?? 0}',
            style: const TextStyle(color: Colors.white),
          ),
          ElevatedButton(
            onPressed: _incrementerRessource,
            child: const Text('Miner'),
          ),
        ],
      ),
    );
  }
}

class RessourcesManager {
  static final RessourcesManager instance = RessourcesManager._internal();

  factory RessourcesManager() {
    return instance;
  }

  RessourcesManager._internal();

  Map<String, int> resources = {
    'Bois': 0,
    'Minerai de fer': 0,
    'Minerai de cuivre': 0,
    'Charbon': 0,
  };

  void incrementerRessource(String nom) {
    resources[nom] = (resources[nom] ?? 0) + 1;
  }
}
