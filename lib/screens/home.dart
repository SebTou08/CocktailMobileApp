import 'package:flutter/material.dart';
import 'package:mycocktailrecipe/screens/drink_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DrinkList(),
    );
  }
}
