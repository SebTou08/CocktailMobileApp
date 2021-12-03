// ignore_for_file: must_be_immutable, no_logic_in_create_state, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mycocktailrecipe/utils/api-connection.dart';

class DrinkListById extends StatefulWidget {
  String idRecived;
  DrinkListById({Key? key, required this.idRecived}) : super(key: key);

  @override
  _DrinkState createState() => _DrinkState(idRecived);
}

class _DrinkState extends State<DrinkListById> {
  late List drinks;
  late ApiConnection apiCon;
  late String id;

  _DrinkState(String idRecived) {
    id = idRecived;
  }

  @override
  void initState() {
    drinks = [];
    apiCon = ApiConnection();
    fetchDrinks();
    super.initState();
  }

  void fetchDrinks() {
    apiCon.fetchDrinksById(id).then((value) {
      setState(() {
        drinks = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(drinks.first.imgUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(drinks.first.instrucciones),
    );
  }
}
