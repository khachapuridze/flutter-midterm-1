import 'package:flutter/material.dart';
import 'package:flutter_learning/screens/add_car_screen.dart';
import 'package:flutter_learning/screens/car_detail_screen.dart';
import 'package:flutter_learning/screens/edit_car_screen.dart';
import 'package:flutter_learning/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cars Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        primaryColor: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              StadiumBorder(),
            ),
          ),
        ),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        AddCarScreen.routeName: (context) => AddCarScreen(),
        CarDetailScreen.routeName: (context) => CarDetailScreen(),
        EditCarScreen.routeName: (context) => EditCarScreen(),
      },
    );
  }
}
