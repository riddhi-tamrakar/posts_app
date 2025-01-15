import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDbService {
  Database? _database;

  Future<void> initializeDatabase(String tableName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'posts_app.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, userId INTEGER, title TEXT, body TEXT)',
        );
      },
    );
  }

  Future<List<Map<String, dynamic>>> fetchLocalData(String tableName) async {
    if (_database == null) return [];
    final List<Map<String, dynamic>> data = await _database!.query(tableName);
    return data;
  }

  Future<void> updateDatabase(
      List<Map<String, dynamic>> data, String tableName) async {
    if (_database == null) return;
    final batch = _database!.batch();
    await _database!.delete(tableName);
    for (final item in data) {
      batch.insert('posts', item);
    }
    await batch.commit();
  }
}
