class Recipe {
  final int id;
  final String name;
  final String image;
  final List<dynamic> ingredients;
  final List<dynamic> instructions;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.ingredients,
    required this.instructions,
  });
}