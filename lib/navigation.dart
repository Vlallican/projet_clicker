
import 'package:flutter/material.dart';
import 'main.dart';
import 'recettes.dart';
import 'inventaire.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    MyHomePage(title: 'Ressources'), // Page de ressources
    RecettesPage(),                 // Page de recettes
    InventairePage(),               // Page d'inventaire
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Ressources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Recettes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventaire',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}