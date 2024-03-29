import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/widgets/detail_app_bar_widget.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/widgets/detail_list_widget.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/widgets/weaknesses_list_widget.dart';

class DetailPage extends StatefulWidget {
  DetailPage({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  bool isOnTop = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
          setState(() {
            if (scrollController.position.pixels > 37) {
              isOnTop = false;
            } else if (scrollController.position.pixels <= 36) {
              isOnTop = true;
            }
          });
          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            DetailAppBarWidget(
              pokemon: widget.pokemon,
              onBack: widget.onBack,
              isOnTop: isOnTop,
            ),
            DetailListWidget(
              pokemon: widget.pokemon,
              list: widget.list,
              controller: widget.controller,
              onChangePokemon: widget.onChangePokemon,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      color: widget.pokemon.baseColor,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          )),
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text(
                                widget.pokemon.name,
                                style: const TextStyle(
                                    backgroundColor: Colors.transparent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('height:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  Text(widget.pokemon.height,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('weight:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  Text(widget.pokemon.weight,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20))
                                ],
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 8),
                                child: Text("Weaknesses",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20))),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: widget.pokemon.weaknesses
                                      .map((e) => WeaknessesListWidget(
                                            weaknesses: e,
                                          ))
                                      .toList(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
