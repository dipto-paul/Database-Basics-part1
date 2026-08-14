
import 'package:basic_sql/Model/task.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class TaskDatabase { // creating database
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
  static Future<List<Task>?>getTask(Task task) async {
    final db = await getDB();
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i)=> Task.fromMap(maps[i]));
  }


  static Future<List<Task>?>insertTask(Task task) async {
    final db = await getDB();
    db.insert('tasks', task.toMap());
  }

}