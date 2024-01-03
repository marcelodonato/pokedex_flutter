import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.pokemon, required this.list})
      : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: const EdgeInsets.only(top: 10), child: Text(pokemon.name)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: list
                    .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(e.name)))
                    .toList(),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
