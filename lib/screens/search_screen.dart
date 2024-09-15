import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static String id = '/search_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Underdevelopment : Screen Search goes here',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
