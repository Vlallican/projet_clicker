import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ressources'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.book),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RecettesPage()),
              );
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: const <Widget>[
          Ressource(couleur: Color(0xffb967969), nom: 'Bois'),
          Ressource(couleur: Color(0xffbced4da), nom: 'Minerai de fer'),
          Ressource(couleur: Color(0xffbd9480f), nom: 'Minerai de cuivre'),
          Ressource(couleur: Color(0xFF000000), nom: 'Charbon'),
        ],
      ),
    );
  }
}

class Ressource extends StatefulWidget {
  final Color couleur; // Couleur du carré
  final String nom; // Nom du carré

  const Ressource({Key? key, required this.couleur, required this.nom}) : super(key: key);

  @override
  _RessourceState createState() => _RessourceState();
}

class _RessourceState extends State<Ressource> {
  int quantite = 0; // Quantité de ressource récoltée

  void _incrementerRessource() {
    setState(() {
      quantite++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            'Quantité: $quantite',
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
}

List<Recette> recettes = [
  Recette(
    nom: 'Hache',
    cout: '2 Bois, 2 Iron rod',
    gameplay: 'Récolter le bois 3 par 3',
    type: 'Outil',
    description: 'Un outil utile',
  ),
  Recette(
    nom: 'Pioche',
    cout: '2 Bois, 3 Iron rod',
    gameplay: 'Récolter les minerais 5 par 5',
    type: 'Outil',
    description: 'Un outil utile',
  ),
  // Ajoutez plus de recettes ici en suivant le même format
];
class RecettesPage extends StatelessWidget {
  const RecettesPage({Key? key}) : super(key: key);

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
              title: Text(recette.nom),
              subtitle: Text('${recette.description}\nCoût: ${recette.cout}'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Logic to produce the item (to be implemented)
                },
                child: const Text('Produire'),
              ),
            ),
          );
        },
      ),
    );
  }
}