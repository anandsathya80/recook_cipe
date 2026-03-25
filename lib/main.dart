import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recook_cipe/features/recipes/data/datasource/recipe_datasource.dart';

// DATA
import 'features/recipes/data/repository/recipe_repository_impl.dart';

// DOMAIN
import 'features/recipes/domain/repository/recipe_repository.dart';

// PRESENTATION
import 'features/recipes/presentation/cubit/recipe_cubit.dart';
import 'features/recipes/presentation/pages/recipe_page.dart';

void main() {
  // init datasource
  final datasource = RecipeRemoteDataSource();

  // init repository
  final RecipeRepository repository = RecipeRepositoryImpl(datasource);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final RecipeRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RecipeCubit(repository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipe App',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.orange,
        ),
        home: const RecipePage(),
      ),
    );
  }
}