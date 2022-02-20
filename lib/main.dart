import 'package:flutter/material.dart';

import 'screens/dashboard.dart';

void main() => runApp(const Booklist());

class Booklist extends StatelessWidget {
  const Booklist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Dashboard(),
    );
  }
}
