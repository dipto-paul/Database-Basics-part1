
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class TaskDatabase {
  static Database ? db;

  static Future<Database>getDB() async{
    if(db != null) return db!;// jodi database thake tahole DB e thakbe

    db = await openDatabase(
      p.join(await getDatabasesPath(), 'task.db'),
      onCreate: (_db, version){
        return _db.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, isDone INTEGER)');
      },
      version: 2
    );
    return db!;

  }
}