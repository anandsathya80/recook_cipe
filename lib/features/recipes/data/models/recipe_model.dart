class RecipeModel {
  final int id;
  final String name;
  final String image;
  final List<dynamic> ingredients;
  final List<dynamic> instructions;

  RecipeModel({
    required this.id,
    required this.name,
    required this.image,
    required this.ingredients,
    required this.instructions,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      ingredients: json['ingredients'],
      instructions: json['instructions'],
    );
  }
}