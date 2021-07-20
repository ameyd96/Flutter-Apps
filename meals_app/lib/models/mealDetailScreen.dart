import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  // MealDetailScreen(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    //for extracting arguments fom named route
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('Details Of Meals Screenn'),
      ),
    );
  }
}
