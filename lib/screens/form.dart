import 'package:booklist/database/dao/book_dao.dart';
import 'package:flutter/material.dart';

import '../models/book.dart';
import '../components/push_dialog.dart';
import 'package:booklist/components/editor.dart';

class BookForm extends StatefulWidget {
  const BookForm({Key? key}) : super(key: key);

  @override
  _BookFormState createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final TextEditingController _controllerBookName = TextEditingController();
  final TextEditingController _controllerAuthorName = TextEditingController();

  final BookDao _dao = BookDao();

  static const _title = 'BookList: Add New Book';

  static String alertMessage = '''
Name or author of the book are not provided.

Please, fill in the fields correctly.''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
        backgroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controllerBookName,
              label: 'Name',
              hint: 'example "Los Miserables"',
            ),
            Editor(
              controller: _controllerAuthorName,
              label: 'Author',
              hint: 'example "Vitor Hugo"',
              icon: Icons.person,
            ),
            ElevatedButton(
              onPressed: () => _performValidation(context),
              child: const Text('save'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal)),
            ),
          ],
        ),
      ),
    );
  }

  void _performValidation(BuildContext context) {
    return _fieldsAreFilled(context)
        ? _createBook(context)
        : pushDialog(context, alertMessage, [_gotItButton(context)]);
  }

  bool _fieldsAreFilled(BuildContext context) {
    String name = _controllerBookName.text;
    String author = _controllerAuthorName.text;

    return (name != '') && (author != '');
  }

  void _createBook(BuildContext context) {
    String name = _controllerBookName.text;
    String author = _controllerAuthorName.text;

    final book = Book(
      id: null,
      name: name,
      author: author,
    );

    _dao.save(book).then((id) => Navigator.pop(context));
  }

  TextButton _gotItButton(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: const Text('Got it.'),
    );
  }
}
