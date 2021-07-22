import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'The Cooking !',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.restaurant,
          //     size: 26,
          //   ),
          //   title: Text(
          //     'Meals',
          //     style: TextStyle(
          //       fontSize: 24,
          //       fontFamily: 'RobotoCondensed',
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   onTap: () {

          //   },
          // ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(FilttersScreen.routeName);
            },
          )
          // ListTile(
          //   leading: Icon(
          //     Icons.settings,
          //     size: 26,
          //   ),
          //   title: Text(
          //     'Settings',
          //     style: TextStyle(
          //       fontSize: 24,
          //       fontFamily: 'RobotoCondensed',
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   onTap: () {

          //   },
          // ),
        ],
      ),
    );
  }
}
