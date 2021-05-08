import 'package:flutter/material.dart';
import 'package:flutter_learning/data/helpers/car_helper.dart';
import 'package:flutter_learning/screens/add_car_screen.dart';
import 'package:flutter_learning/screens/car_detail_screen.dart';
import 'package:flutter_learning/widgets/main_list_item.dart';
import 'package:provider/provider.dart';

import 'edit_car_screen.dart';

class HomeScreen extends StatelessWidget {
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
              Navigator.pushNamed(context, AddCarScreen.routeName);
            },
          ),
        ],
      ),
      body: Container(
        child: Consumer<CarHelper>(
          builder: (BuildContext context, carHelper, child) {
            return ListView.builder(
              itemBuilder: (item, index) {
                var car = carHelper.carList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CarDetailScreen.routeName,
                        arguments: car);
                  },
                  onLongPress: () {
                    Navigator.pushNamed(
                      context,
                      EditCarScreen.routeName,
                      arguments: {"car": car, "index": index},
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
              itemCount: carHelper.carList.length,
            );
          },
        ),
      ),
    );
  }
}
