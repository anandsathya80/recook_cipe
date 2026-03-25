import 'package:flutter/material.dart';

import '../../domain/entites/recipe.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // APP BAR IMAGE
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                recipe.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              background: Image.network(
                recipe.image,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // CONTENT
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // INGREDIENTS
                  Text(
                    "Ingredients",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),

                  ...recipe.ingredients.map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text("• $e"),
                    ),
                  ),

                  SizedBox(height: 16),

                  // INSTRUCTIONS
                  Text(
                    "Instructions",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),

                  ...recipe.instructions.asMap().entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text("${entry.key + 1}. ${entry.value}"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}