import 'package:flutter/material.dart';



import './dummy_data.dart';


import './screens/filter_screen.dart';


import './screens/tabs_screen.dart';

//import 'screens/tabs_screen1.dart';
import './screens/meal_detaiRecepie_screen.dart';
import './screens/mealDetailScreen.dart';
import './screens/categories_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters ={
    'gluten':false,
    'lactose':false,
    'vegetarian':false,
    'vegan':false,
  };


List<Meal> _availableMeals =DUMMY_MEALS;
List<Meal> _favoriteMeals =[];


  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        return true;
      }).toList();
    });

  }


  //Logic for adding Fav

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if(existingIndex >=0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
    }

  }

  bool _isMealFav(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
     // home: CategoriesScreen(),
     //home: TabsScreen(),
      routes: {
        '/' : (ctx) => TabsScreen(_favoriteMeals),
        '/categoryMeals' : (context) => MealDetailScreen(_availableMeals),
        MealDetailRecepieScreen.routeName : (ctx) => MealDetailRecepieScreen(_toggleFavorite,_isMealFav),
        FilttersScreen.routeName : (ctx) => FilttersScreen(_filters,_setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
    
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
