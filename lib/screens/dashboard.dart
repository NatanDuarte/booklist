import 'package:flutter/material.dart';

import '../components/home_image.dart';
import '../components/library_button.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _title = Text('BookList: dashboard');

    return Scaffold(
      appBar: AppBar(
        title: _title,
      ),
      body: _dashborardLayout(),
    );
  }

  Column _dashborardLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        HomeImage(),
        LibraryButton(),
      ],
    );
  }
}
