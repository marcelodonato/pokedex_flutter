import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({
    Key? key,
    required this.pokemon,
    required this.onTap,
  }) : super(key: key);
  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap('/details', DetailArguments(pokemon: pokemon)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: pokemon.baseColor!.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Text(
                          pokemon.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                      Text(
                        '#${pokemon.num}',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemon.type
                            .map((e) => TypeWidget(
                                  name: e,
                                ))
                            .toList(),
                      ),
                      const Flexible(
                          child: SizedBox(
                        height: 50,
                        width: 50,
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            right: 2,
            child: Image.network(
              pokemon.image,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}
