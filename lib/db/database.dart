import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:todo/Model/task.dart';

class Databaseprovider {
  static final Databaseprovider _instance = Databaseprovider.internal();
  factory Databaseprovider() => _instance;
  Databaseprovider.internal();

  static Database _database;

  Future<Database> createDatabae() async {
    if (_database != null) {
      return _database;
    }
    String path = join(await getDatabasesPath(), 'TheDataBase.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) {
        db.execute(
            "create table Tasks(id integer primary key autoincrement, title varchar(20), task varchar(200), time varchar(20) )");
      },
    );
    return _database;
  }

  Future<int> insertTask(Task task) async {
    Database db = await createDatabae();
    return db.insert("Tasks", task.toMap());
  }

  Future<List> getTask() async {
    Database db = await createDatabae();
    return db.query('Tasks');
  }

  Future<void> deleteTask(int id) async {
    Database db = await createDatabae();
    db.delete('Tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future <int> getNumberTask() async {
    Database db = await createDatabae();
    // int count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM table_name'));

    // print( 'count  is ${count}');
    // return count;
  }
}
