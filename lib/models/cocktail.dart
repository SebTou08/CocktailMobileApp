class Cocktail {
  String id;
  String name;
  String category;
  String imgUrl;

  Cocktail({
    required this.id,
    required this.name,
    required this.category,
    required this.imgUrl,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
        id: json["idDrink"],
        name: json["strDrink"],
        category: json["strCategory"],
        imgUrl: json["strDrinkThumb"]);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'category': category, 'imgUrl': imgUrl};
  }
}
