import 'package:flutter/material.dart';

Future<void> pushDialog(
    BuildContext context, String message, List<TextButton> actionList) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Atention'),
        content: _content(message),
        actions: actionList,
      );
    },
  );
}

SingleChildScrollView _content(String message) {
  return SingleChildScrollView(
    child: _listBody(message),
  );
}

ListBody _listBody(String message) {
  return ListBody(
    children: [
      Text(message),
    ],
  );
}
