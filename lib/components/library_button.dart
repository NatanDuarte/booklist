import 'package:flutter/material.dart';

import '../screens/list.dart';

class LibraryButton extends StatelessWidget {
  const LibraryButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return const BookList();
        }),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          ),
          padding: const EdgeInsets.all(16.0),
          height: 100,
          width: 150,
          child: _buttonLayout(),
        ),
      ),
    );
  }

  Column _buttonLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        Icon(Icons.library_books),
        Text(
          "My library",
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
