import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqldb {

  static Database? _db;

  Future<Database?> get db async{
    if (_db == null){
      _db = await initialDB();
      return _db;
    }else{
      return _db;
    }
  }

  initialDB() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'saad.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion){

  }


  _onCreate(Database db, int version) async{
    await db.execute(''''"
    CREATE TABLE "notes" (
      id INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY,
      notes TEXT NOT NULL 
    )
    "''');
    print("Create DATABASE AND TABLE ===============================");
  }

  readData(String sql) async{
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }


}