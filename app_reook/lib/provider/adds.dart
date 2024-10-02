import 'package:app_reook/db_Helper.dart';
import 'package:app_reook/elements/books.dart';
import 'package:flutter/material.dart';

class Adds with ChangeNotifier {
  List<Bookss> _items = [];
  final dbHelper = DatabaseHelper();

  Adds() {
    _loadBooks();
  }

  List<Bookss> get all {
    return [..._items];
  }

  int get count {
    return _items.length;
  }

  Bookss byIndex(int index) {
    return _items[index];
  }

  Future<void> _loadBooks() async {
    _items = await dbHelper.getAllBooks();
    notifyListeners();
  }

  Future<void> put(Bookss book) async {
    if (book.id != null && book.id!.trim().isNotEmpty) {
      await dbHelper.saveBook(book);
      _loadBooks();
    } else {
      book.id = DateTime.now().toString(); // Gerar um ID único
      await dbHelper.saveBook(book);
      _loadBooks();
    }
  }

  Future<void> remove(Bookss book) async {
    if (book.id != null) {
      await dbHelper.deleteBook(book.id!);
      notifyListeners();
    }
  }
}
