import 'package:first_app/defults/dio.dart';
import 'package:first_app/layout/task1.dart';
import 'package:flutter/material.dart';

import 'layout/NewsLayout.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp() ,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    theme:ThemeData(appBarTheme: AppBarTheme(
      titleTextStyle:TextStyle(
        fontWeight: FontWeight.bold ,
        fontSize: 20.0 ,
        color: Colors.amberAccent ,
      ),
      color: Colors.black38,
      elevation: 0.0,

    ),
      bottomNavigationBarTheme:BottomNavigationBarThemeData(type: BottomNavigationBarType.fixed , elevation: 2.0,selectedItemColor: Colors.amberAccent,
      ) ,
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.amber) ,
    ),

    home: ProfileScreen(),);

  }



}