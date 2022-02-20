import 'package:booklist/database/dao/book_dao.dart';
import 'package:flutter/material.dart';

import 'package:booklist/screens/form.dart';
import 'package:booklist/components/book_item.dart';
import 'package:booklist/components/loading_screen.dart';
import 'package:booklist/models/book.dart';

class BookList extends StatefulWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final BookDao _dao = BookDao();

  static const _title = 'My Books';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
        backgroundColor: Colors.black45,
      ),
      body: FutureBuilder<List<Book>>(
        initialData: const [],
        future: _dao.findAll(),
        builder: _buildConnectionState(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: 'Add a new book.',
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const BookForm()))
            .then((value) => setState(() {})),
      ),
    );
  }

  _buildConnectionState() {
    return ((context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          break;
        case ConnectionState.waiting:
          return const LoadingScreen();
        case ConnectionState.active:
          break;
        case ConnectionState.done:
          return _renderBooks(snapshot);
      }
      return const Text('unknown error');
    });
  }

  ListView _renderBooks(snapshot) {
    final List<Book> books = snapshot.data as List<Book>;
    return ListView.builder(
      itemBuilder: (context, index) {
        final book = books[index];
        return BookItem(book);
      },
      itemCount: books.length,
    );
  }
}
