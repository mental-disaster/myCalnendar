import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbManager{
  static const dbPath = '';
  static const dbName = 'myCalendar.db';

  static const tbName = 'memo';

  static const colId = 'id';
  static const colTitle = 'title';
  static const colDetail = 'detail';
  static const colDate = 'date';

  late Database _db;

  Future<void> init() async {
    _db = await openDatabase(
        join(dbPath, dbName),
        onCreate: _onCreate
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tbName(
        $colId INTEGER PRIMARY KEY,
        $colTitle TEXT,
        $colDetail TEXT,
        $colDate TEXT,
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    return await _db.insert(tbName, row);
  }

  Future<int> update(Map<String, dynamic> row) async {
    int tgtId = row[colId];
    return await _db.update(
        tbName,
        row,
        where: '$colId = $tgtId'
    );
  }

  Future<int> delete(int id) async {
    return await _db.delete(
        tbName,
        where: '$colId = $id'
    );
  }
}