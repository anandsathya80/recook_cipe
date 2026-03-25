import 'package:recook_cipe/features/recipes/data/datasource/recipe_datasource.dart';

import '../../domain/entites/recipe.dart';
import '../../domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeRemoteDataSource dataSource;

  RecipeRepositoryImpl(this.dataSource);

  @override
  Future<List<Recipe>> getRecipes() async {
    final result = await dataSource.getRecipes();

    return result
        .map((e) => Recipe(
              id: e.id,
              name: e.name,
              image: e.image,
              ingredients: e.ingredients,
              instructions: e.instructions,
            ))
        .toList();
  }
}
