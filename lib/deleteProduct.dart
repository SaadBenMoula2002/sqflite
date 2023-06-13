import 'package:flutter/material.dart';
import 'sqldb.dart';

class DeleteProductPage extends StatefulWidget {
  @override
  _DeleteProductPageState createState() => _DeleteProductPageState();
}

class _DeleteProductPageState extends State<DeleteProductPage> {
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supprimer produit'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _idController,
            decoration: InputDecoration(
              labelText: 'ID du produit',
            ),
          ),
          ElevatedButton(
            child: Text('Supprimer'),
            onPressed: () async {
              int id = int.parse(_idController.text);
              String sql = "DELETE FROM produits WHERE id = $id";
              int deletedRows = await Sqldb().deleteData(sql);
              // Traitez le nombre de lignes supprimées ici
            },
          ),
        ],
      ),
    );
  }
}