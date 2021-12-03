// ignore_for_file: file_names
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mycocktailrecipe/models/cocktail.dart';
import 'package:mycocktailrecipe/models/cocktail_by_id.dart';

class ApiConnection {
  Future<List> fetchDrinks() async {
    String urlString =
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita';

    Uri url = Uri.parse(urlString);
    http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      final maps = jsonResponse['drinks'];
      List categories = maps.map((map) => Cocktail.fromJson(map)).toList();
      return categories;
    }
    return [];
  }

  Future<List> fetchDrinksById(String id) async {
    String urlString =
        'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id';

    Uri url = Uri.parse(urlString);
    http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      final maps = jsonResponse['drinks'];
      List categories = maps.map((map) => CocktailById.fromJson(map)).toList();
      return categories;
    }
    return [];
  }
}
