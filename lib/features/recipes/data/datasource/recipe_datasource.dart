import 'dart:convert';

import 'package:recook_cipe/core/network/api_client.dart';
import 'package:recook_cipe/features/recipes/data/models/recipe_model.dart';

class RecipeRemoteDataSource {
  Future<List<RecipeModel>> getRecipes() async {
    final response = await ApiClient.get("/recipes");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List list = data['recipes'];

      return list.map((e) => RecipeModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load data. Check DB connection");
    }
  }
}
