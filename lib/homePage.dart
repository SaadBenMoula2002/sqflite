import 'package:flutter/material.dart';

import 'addProduct.dart';
import 'deleteProduct.dart';
import 'searchProduct.dart';
import 'updateProduct.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon App Bar'),
      ),
      body: Center(
        child: Text('Contenu de la page principale'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Rechercher produits'),
              onTap: () {
                Navigator.pop(context); // Ferme le menu
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
            ),
            ListTile(
              title: Text('Ajouter produit'),
              onTap: () {
                Navigator.pop(context); // Ferme le menu
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductPage()),
                );
              },
            ),
            ListTile(
              title: Text('Modifier produit'),
              onTap: () {
                Navigator.pop(context); // Ferme le menu
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ModifyProductPage()),
                );
              },
            ),
            ListTile(
              title: Text('Supprimer produit'),
              onTap: () {
                Navigator.pop(context); // Ferme le menu
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DeleteProductPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}