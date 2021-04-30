import 'package:flutter/material.dart';
import 'package:flutter_learning/widgets/add_car_widget.dart';

class AddCarScreen extends StatelessWidget {
  static const routeName = "/add-car";
  final _formKey = GlobalKey<FormState>();

  // add input controllers
  TextEditingController carId = TextEditingController();
  TextEditingController carBrand = TextEditingController();
  TextEditingController carModel = TextEditingController();
  TextEditingController carYear = TextEditingController();
  TextEditingController carDescription = TextEditingController();
  TextEditingController carImage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("add new Car"),
      ),
      body: AddCarWidget(
          formKey: _formKey,
          carId: carId,
          carBrand: carBrand,
          carModel: carModel,
          carDescription: carDescription,
          carYear: carYear,
          carImage: carImage),
    );
  }
}
