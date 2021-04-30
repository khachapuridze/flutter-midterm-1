import 'package:flutter/material.dart';
import 'package:flutter_learning/data/helpers/car_helper.dart';
import 'package:flutter_learning/data/models/car_model.dart';
import 'package:flutter_learning/widgets/car_detail_widget.dart';

import 'edit_car_screen.dart';

class CarDetailScreen extends StatelessWidget {
  static const routeName = "/car-detail";

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    final Car args = ModalRoute.of(context).settings.arguments as Car;
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure ?'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'Would you like to delete ${args.brand} - ${args.model}?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  CarHelper().removeCar(args);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              _showMyDialog();
            },
          ),
        ],
      ),
      body: CarDetailWidget(screenSize: screenSize, args: args),
    );
  }
}
