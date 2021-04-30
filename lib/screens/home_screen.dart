import 'package:flutter/material.dart';
import 'package:flutter_learning/data/models/car_model.dart';
import 'package:flutter_learning/data/models/dummy_data.dart';
import 'package:flutter_learning/screens/add_car_screen.dart';
import 'package:flutter_learning/screens/car_detail_screen.dart';
import 'package:flutter_learning/widgets/main_list_item.dart';

import 'edit_car_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Car> carList = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars Gallery'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              Navigator.pushNamed(context, AddCarScreen.routeName).then((_) {
                setState(() {});
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (item, index) {
          var car = carList[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CarDetailScreen.routeName,
                      arguments: car)
                  .then((_) {
                setState(() {});
              });
            },
            onLongPress: () {
              Navigator.pushNamed(
                context,
                EditCarScreen.routeName,
                arguments: {"car": car},
              );
            },
            child: MainListItem(
              imageUrl: car.imageUrl,
              brand: car.brand,
              model: car.model.toString(),
              year: car.year.toString(),
              description: car.description.toString(),
            ),
          );
        },
        itemCount: carList.length,
      ),
    );
  }
}
