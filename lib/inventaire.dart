import 'package:flutter/material.dart';

class InventairePage extends StatefulWidget {
  const InventairePage({Key? key}) : super(key: key);

  @override
  _InventairePageState createState() => _InventairePageState();
}

class _InventairePageState extends State<InventairePage> {
  List<MapEntry<String, int>> items = [];
  bool triNom = true;
  bool triQuantite = true;

  @override
  void initState() {
    super.initState();
    items = Inventaire.inventaire.entries.toList();
  }

  // Tri les recettes par nom.
  void trierParNom() {
    setState(() {
      items.sort((a, b) => triNom ? a.key.compareTo(b.key) : b.key.compareTo(a.key));

      // Change le sens du tri.
      triNom = !triNom;
    });
  }

  // Tri les recettes par quantités.
  void trierParQuantite() {
    setState(() {
      items.sort((a, b) => triQuantite ? a.value.compareTo(b.value) : b.value.compareTo(a.value));

      // Change le sens du tri.
      triQuantite = !triQuantite;
    });
  }

  // Affichage de l'inventaire.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventaire'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: trierParNom,
          ),
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: trierParQuantite,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(items[index].key),
              trailing: Text('${items[index].value}'),
            ),
          );
        },
      ),
    );
  }
}

class Inventaire {
  static final Map<String, int> inventaire = {};

  static void ajouterRecette(String nom) {
    if (inventaire.containsKey(nom)) {

      // J'ajoute par 100 afin de tester plusu rapidement l'ajout du charbon en ressource sinon pour le jeu ça sera 1.
      inventaire[nom] = inventaire[nom]! + 100;
    } else {
      inventaire[nom] = 1;
    }
  }
}