import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/favorite_meals.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Vamos cozinhar?',
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.category),
                text: 'Favoritos',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Categories(),
            FavoriteMeals(),
          ],
        ),
      ),
    );
  }
}
