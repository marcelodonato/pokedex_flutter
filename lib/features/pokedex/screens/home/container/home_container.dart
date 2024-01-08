import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/new_home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NewHomePage();
  }
}
