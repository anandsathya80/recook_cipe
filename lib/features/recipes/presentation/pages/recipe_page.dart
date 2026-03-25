import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      appBar: AppBar(title: Text("Recipes")),
      body: BlocBuilder<RecipeCubit, List>(
        builder: (context, recipes) {
          if (recipes.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            padding: EdgeInsets.all(12),
            itemCount: recipes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return RecipeCard(recipe: recipes[index]);
            },
          );
        },
      ),
    );
  }
}