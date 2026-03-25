import '../../domain/entites/recipe.dart';
import '../../domain/repository/recipe_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeCubit extends Cubit<List<Recipe>> {
  final RecipeRepository repository;

  RecipeCubit(this.repository) : super([]);

  void fetchRecipes() async {
    final data = await repository.getRecipes();
    emit(data);
  }
}