import 'package:app_reook/elements/books.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'books.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int newerVersion) async {
        await db.execute(
            'CREATE TABLE books(id TEXT PRIMARY KEY, name TEXT, category TEXT, page TEXT)');
      },
    );
  }

  Future<int> saveBook(Bookss book) async {
    var dbClient = await db;
    return await dbClient!.insert('books', book.toMap());
  }

  Future<List<Bookss>> getAllBooks() async {
    var dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient!.query('books');

    return result.map((book) => Bookss.fromMap(book)).toList();
  }

  Future<int> deleteBook(String id) async {
    var dbClient = await db;
    return await dbClient!.delete('books', where: 'id = ?', whereArgs: [id]);
  }
}
