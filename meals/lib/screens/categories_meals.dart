import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal/meal.dart';

class CategoriesMeals extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMeals(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: (categoryMeals.isEmpty
          ? Center(
              child: Text('Nenhuma refeição encontrada'),
            )
          : ListView.builder(
              itemCount: categoryMeals.length,
              itemBuilder: (ctx, index) {
                return MealItem(categoryMeals[index]);
              })),
    );
  }
}
