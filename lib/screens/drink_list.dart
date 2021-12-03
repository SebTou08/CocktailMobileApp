import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mycocktailrecipe/models/cocktail.dart';
import 'package:mycocktailrecipe/screens/drink_by_id_list.dart';
import 'package:mycocktailrecipe/utils/api-connection.dart';

class DrinkList extends StatefulWidget {
  const DrinkList({Key? key}) : super(key: key);

  @override
  _DrinksListState createState() => _DrinksListState();
}

class _DrinksListState extends State<DrinkList> {
  late List drinks;
  late ApiConnection apiCon;

  @override
  void initState() {
    drinks = [];
    apiCon = ApiConnection();
    fetchDrinks();
    super.initState();
  }

  void fetchDrinks() {
    apiCon.fetchDrinks().then((value) {
      setState(() {
        drinks = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //return DrinkItem(drink: drinks[index]);
    return Swiper(
      onTap: (index) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DrinkListById(idRecived: drinks[index].id)));
      },
      itemCount: drinks.length,
      itemHeight: size.height / 1.8,
      itemWidth: double.infinity,
      containerWidth: double.infinity,
      layout: SwiperLayout.CUSTOM,
      controller: SwiperController(),
      customLayoutOption:
          CustomLayoutOption(startIndex: 0, stateCount: 3).addOpacity(
        [0.25, 0.5, 1.0, 0.1],
      ).addTranslate([
        const Offset(0.0, 20.0),
        const Offset(0.0, -10.0),
        const Offset(0.0, -50.0),
        const Offset(0.0, -100.0),
      ]).addScale([0.75, 0.85, 1.0], Alignment.bottomCenter),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                drinks[index].imgUrl,
                height: size.height / 1.8,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Container(
                height: size.height / 1.8,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x00000000),
                      Color(0x00000000),
                      Color(0xCC000000),
                      Color(0xCC000000),
                    ],
                  ),
                ),
              ),
              Text(drinks[index].name,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ))
            ],
          ),
        );
      },
    );
  }
}

class DrinkItem extends StatelessWidget {
  final Cocktail drink;
  const DrinkItem({Key? key, required this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("sd");
  }
}
