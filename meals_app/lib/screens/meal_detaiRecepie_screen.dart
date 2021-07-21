import 'package:flutter/material.dart';

class MealDetailRecepieScreen extends StatelessWidget {
  static const routeName = '/meal-dtails';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(body: Center(child: Text('Recepie of food $mealId'),),appBar: AppBar(title: Text('$mealId'),),);
  }
}