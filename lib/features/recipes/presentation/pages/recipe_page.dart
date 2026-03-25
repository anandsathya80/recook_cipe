import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../cubit/recipe_cubit.dart';
import '../widgets/recipe_card.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  void initState() {
    super.initState();
    context.read<RecipeCubit>().fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
        centerTitle: true,
      ),
      body: BlocBuilder<RecipeCubit, List>(
        builder: (context, recipes) {
          if (recipes.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return MasonryGridView.count(
            padding: const EdgeInsets.all(12),

            crossAxisCount: 2, // jumlah kolom

            mainAxisSpacing: 12, // jarak vertikal
            crossAxisSpacing: 12, // jarak horizontal

            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];

              return RecipeCard(recipe: recipe);
            },
          );
        },
      ),
    );
  }
}
