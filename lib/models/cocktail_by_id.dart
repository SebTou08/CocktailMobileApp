class CocktailById {
  String id;
  String name;
  String category;
  String imgUrl;
  String instrucciones;

  CocktailById(
      {required this.id,
      required this.name,
      required this.category,
      required this.imgUrl,
      required this.instrucciones,
      instructions});

  factory CocktailById.fromJson(Map<String, dynamic> json) {
    return CocktailById(
      id: json["idDrink"],
      name: json["strDrink"],
      category: json["strCategory"],
      imgUrl: json["strDrinkThumb"],
      instrucciones: json["strInstructions"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'imgUrl': imgUrl,
      'instrucciones': instrucciones
    };
  }
}
