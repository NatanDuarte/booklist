import 'package:booklist/database/database.dart';
import 'package:booklist/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class BookDao {
  static const String _tableName = 'books';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _author = 'author';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_author TEXT)';

  Future<int> save(Book book) async {
    final Database db = await getDatabase();
    return db.insert(_tableName, book.toMap());
  }

  Future<void> deleteBook(int id) async {
    final Database db = await getDatabase();
    const String whereQuery = 'id = ?';
    await db.delete(
      _tableName,
      where: whereQuery,
      whereArgs: [_id],
    );
  }

  Future<List<Book>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Book> books = [];

    for (Map<String, dynamic> row in result) {
      final Book book = Book(
        id: row[_id],
        name: row[_name],
        author: row[_author],
      );
      books.add(book);
    }
    return books;
  }
}
