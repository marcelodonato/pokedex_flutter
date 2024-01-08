import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/new_home_page.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({Key? key, required this.repository}) : super(key: key);
  final PokemonRepository repository;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return NewHomePage();
            },
          );
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailContainer(
                repository: repository,
                arguments: (settings.arguments as DetailArguments),
                onBack: () => Navigator.of(context).pop(),
              );
            },
          );
        }
      },
    );
  }
}
