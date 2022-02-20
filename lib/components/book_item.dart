import 'package:booklist/components/push_dialog.dart';
import 'package:booklist/database/dao/book_dao.dart';
import 'package:flutter/material.dart';
import 'package:booklist/models/book.dart';

class BookItem extends StatefulWidget {
  final Book _book;

  const BookItem(this._book, {Key? key}) : super(key: key);

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  final BookDao _dao = BookDao();

  @override
  Widget build(BuildContext context) {
    String confirmDeletionMessage = '''
Are you sure you want to delete "${widget._book.name}"?

this action cannot be undone.
''';

    return Card(
      child: ListTile(
        leading: const Icon(Icons.book),
        title: Text(widget._book.name),
        subtitle: Text('by ${widget._book.author}'),
        onLongPress: () => pushDialog(context, confirmDeletionMessage, [
          _buttonConfirmDeletion(context, widget._book.id!),
          _buttonCancelDeletion(context),
        ]),
      ),
    );
  }

  TextButton _buttonConfirmDeletion(BuildContext context, int id) {
    return TextButton(
      onPressed: () async {
        _dao.deleteBook(id).then((id) => Navigator.of(context).pop());
      },
      child: const Text('delete'),
    );
  }

  TextButton _buttonCancelDeletion(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: const Text('cancel'),
    );
  }
}
