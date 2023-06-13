import 'package:flutter/material.dart';
import 'sqldb.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _labelleController = TextEditingController();
  final TextEditingController _prixController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter produit'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _labelleController,
            decoration: InputDecoration(
              labelText: 'Labelle',
            ),
          ),
          TextField(
            controller: _prixController,
            decoration: InputDecoration(
              labelText: 'Prix',
            ),
          ),
          TextField(
            controller: _dateController,
            decoration: InputDecoration(
              labelText: 'Date',
            ),
          ),
          ElevatedButton(
            child: Text('Ajouter'),
            onPressed: () async {
              String labelle = _labelleController.text;
              double prix = double.parse(_prixController.text);
              String date = _dateController.text;
              String sql =
                  "INSERT INTO produits (labelle, prix, date) VALUES ('$labelle', $prix, '$date')";
              int insertedRows = await Sqldb().insertData(sql);
              // Traitez le nombre de lignes insérées ici
            },
          ),
        ],
      ),
    );
  }
}
