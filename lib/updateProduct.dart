import 'package:flutter/material.dart';
import 'sqldb.dart';

class ModifyProductPage extends StatefulWidget {
  @override
  _ModifyProductPageState createState() => _ModifyProductPageState();
}

class _ModifyProductPageState extends State<ModifyProductPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _newLabelleController = TextEditingController();
  final TextEditingController _newPrixController = TextEditingController();
  final TextEditingController _newDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier produit'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _idController,
            decoration: InputDecoration(
              labelText: 'ID du produit',
            ),
          ),
          TextField(
            controller: _newLabelleController,
            decoration: InputDecoration(
              labelText: 'Nouveau labelle',
            ),
          ),
          TextField(
            controller: _newPrixController,
            decoration: InputDecoration(
              labelText: 'Nouveau prix',
            ),
          ),
          TextField(
            controller: _newDateController,
            decoration: InputDecoration(
              labelText: 'Nouvelle date',
            ),
          ),
          ElevatedButton(
            child: Text('Modifier'),
            onPressed: () async {
              int id = int.parse(_idController.text);
              String newLabelle = _newLabelleController.text;
              double newPrix = double.parse(_newPrixController.text);
              String newDate = _newDateController.text;
              String sql =
                  "UPDATE produits SET labelle = '$newLabelle', prix = $newPrix, date = '$newDate' WHERE id = $id";
              int updatedRows = await Sqldb().updateData(sql);
              // Traitez le nombre de lignes mises à jour ici
            },
          ),
        ],
      ),
    );
  }
}
