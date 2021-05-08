import 'package:flutter/material.dart';

import 'package:flutter_learning/data/models/car_model.dart';
import 'package:flutter_learning/widgets/edit_car_widget.dart';

class EditCarScreen extends StatefulWidget {
  static const routeName = "/edit-car-screen";
  @override
  _EditCarScreenState createState() => _EditCarScreenState();
}

class _EditCarScreenState extends State<EditCarScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController carId;
  TextEditingController carBrand;
  TextEditingController carModel;
  TextEditingController carYear;
  TextEditingController carDescription;
  TextEditingController carImage;
  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context).settings.arguments as Map;
    final Car car = parsedData["car"];
    final int index = parsedData["index"];
    carId = TextEditingController(text: car.id.toString());
    carBrand = TextEditingController(text: car.brand);
    carModel = TextEditingController(text: car.model);
    carYear = TextEditingController(text: car.year.toString());
    carDescription = TextEditingController(text: car.description.toString());
    carImage = TextEditingController(text: car.imageUrl.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Car"),
      ),
      body: EditCarWidget(
          formKey: _formKey,
          carId: carId,
          carBrand: carBrand,
          carModel: carModel,
          carDescription: carDescription,
          carYear: carYear,
          carImage: carImage,
          index: index),
    );
  }
}
