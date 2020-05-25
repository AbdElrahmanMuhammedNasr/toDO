import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Databaseprovider{

  Database _database;

  Future<Database> get database async{
    
    if(_database !=null){
      return _database;
    }
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async{
    String path = await getDatabasesPath();

    return await openDatabase(
      join(path,'task.db'),
      version: 1,
      onCreate: (Database database,  int version)async{
          await database.execute(
              "CREATE TABLE TASK (ID INTGER PRIMARY KEY, TYPE TEXT ,  TITLE TEXT, TASK TEXT )",
          );
      }
    );
  }

}