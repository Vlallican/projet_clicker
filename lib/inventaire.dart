import 'package:flutter/material.dart';

class InventairePage extends StatefulWidget {
  const InventairePage({Key? key}) : super(key: key);

  @override
  _InventairePageState createState() => _InventairePageState();
}

class _InventairePageState extends State<InventairePage> {
  List<MapEntry<String, int>> items = [];
  bool triNomAscendant = true;
  bool triQuantiteAscendant = true;

  @override
  void initState() {
    super.initState();
    items = InventaireManager.inventaire.entries.toList();
  }

  void trierParNom() {
    setState(() {
      items.sort((a, b) => triNomAscendant ? a.key.compareTo(b.key) : b.key.compareTo(a.key));
      triNomAscendant = !triNomAscendant; // Bascule le sens du tri
    });
  }

  void trierParQuantite() {
    setState(() {
      items.sort((a, b) => triQuantiteAscendant ? a.value.compareTo(b.value) : b.value.compareTo(a.value));
      triQuantiteAscendant = !triQuantiteAscendant; // Bascule le sens du tri
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventaire'),
        actions: <Widget>[
          IconButton(
            icon: Icon(triNomAscendant ? Icons.sort_by_alpha : Icons.sort_by_alpha_outlined),
            onPressed: trierParNom,
          ),
          IconButton(
            icon: Icon(triQuantiteAscendant ? Icons.sort : Icons.sort_outlined),
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

class InventaireManager {
  static final Map<String, int> inventaire = {};

  static void ajouterRecette(String nom) {
    if (inventaire.containsKey(nom)) {
      inventaire[nom] = inventaire[nom]! + 100;
    } else {
      inventaire[nom] = 1;
    }
  }
}