import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;

  // MealDetailScreen(this.categoryId,this.categoryTitle);

  final List<Meal> availableMeals;

  MealDetailScreen(this.availableMeals);
  
  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  @override
  Widget build(BuildContext context) {
    //for extracting arguments fom named route
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    // final categoryMeals = DUMMY_MEALS.where((meals) {
    //   return meals.categories.contains(categoryId);
    // }).toList();
    final categoryMeals = widget.availableMeals.where((meals) {
      return meals.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
