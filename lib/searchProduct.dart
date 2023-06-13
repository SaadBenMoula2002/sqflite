import 'package:flutter/material.dart';
import 'sqldb.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rechercher produits'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Rechercher',
            ),
          ),
          ElevatedButton(
            child: Text('Rechercher'),
            onPressed: () async {
              String searchText = _searchController.text;
              String sql =
                  "SELECT * FROM produits WHERE labelle LIKE '%$searchText%'";
              List<Map> results = await Sqldb().readData(sql);
              // Traitez les résultats de la recherche ici
            },
          ),
        ],
      ),
    );
  }
}
