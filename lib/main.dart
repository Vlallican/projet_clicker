import 'package:flutter/material.dart';
import 'inventaire.dart';
import 'navigation.dart';
import 'ressources.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NavigationPage(),
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
  var resources = RessourcesManager().resources;

  // Affichage des ressources.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: <Widget>[
          Ressources(couleur: Color(0xffb967969), nom: 'Bois', resources: resources),
          Ressources(couleur: Color(0xffbced4da), nom: 'Minerai de fer', resources: resources),
          Ressources(couleur: Color(0xffbd9480f), nom: 'Minerai de cuivre', resources: resources),
          if (Inventaire.inventaire['Lingot de fer'] != null &&
              Inventaire.inventaire['Lingot de fer']! >= 1000 &&
              Inventaire.inventaire['Lingot de cuivre'] != null &&
              Inventaire.inventaire['Lingot de cuivre']! >= 1000)
            Ressources(couleur: Color(0xFF000000), nom: 'Charbon', resources: resources),
        ],
      ),
    );
  }
}