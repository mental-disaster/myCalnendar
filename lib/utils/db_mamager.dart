import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../app/model/memo.dart';

class DbManager{
  static const dbPath = '';
  static const dbName = 'myCalendar.db';

  static const tbName = 'memo';

  static const colId = 'id';
  static const colTitle = 'title';
  static const colDetail = 'detail';
  static const colDate = 'date';

  late Database _db;

  static final DbManager _instance = DbManager._internal();

  factory DbManager() {
    return _instance;
  }

  DbManager._internal();


  Future<void> init() async {
    _db = await openDatabase(
        join(dbPath, dbName),
        onCreate: _onCreate
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tbName(
        $colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colTitle TEXT,
        $colDetail TEXT,
        $colDate TEXT
    )''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    return await _db.insert(tbName, row);
  }

  Future<List<Memo>> select(DateTime date) async {
    final dateString = "${date.year}-${date.month}-${date.day}";

    final List<Map<String, dynamic>> maps = await _db.query(
      tbName,
      where: '$colDate = ?',
      whereArgs: [dateString],
    );

    return List.generate(maps.length, (i) {
      return Memo.fromJson(maps[i]);
    });
  }

  Future<int> update(Map<String, dynamic> row) async {
    int tgtId = row[colId];
    return await _db.update(
        tbName,
        row,
        where: '$colId = ?',
        whereArgs: [tgtId]
    );
  }

  Future<int> delete(int id) async {
    return await _db.delete(
        tbName,
        where: '$colId = ?',
        whereArgs: [id]
    );
  }
}
