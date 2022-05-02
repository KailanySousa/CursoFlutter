import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal/meal.dart';

class FavoriteMeals extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteMeals(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma refeição favorita encontrada'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeals[index]);
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
