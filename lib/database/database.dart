import 'package:booklist/database/dao/book_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'books.db');

  return openDatabase(path, onCreate: (db, version) {
    db.execute(BookDao.tableSql);
  }, version: 1);
}
