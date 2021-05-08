import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning/data/helpers/car_helper.dart';
import 'package:flutter_learning/data/models/car_model.dart';
import 'package:provider/provider.dart';

class EditCarWidget extends StatelessWidget {
  const EditCarWidget({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.carId,
    @required this.carBrand,
    @required this.carModel,
    @required this.carDescription,
    @required this.carYear,
    @required this.carImage,
    @required this.index,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController carId;
  final TextEditingController carBrand;
  final TextEditingController carModel;
  final TextEditingController carDescription;
  final TextEditingController carYear;
  final TextEditingController carImage;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Card(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      controller: carId,
                      decoration: InputDecoration(
                        labelText: 'Id',
                        hintText: "enter id",
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 3.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter valid id";
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      controller: carBrand,
                      decoration: InputDecoration(
                        labelText: 'Brand',
                        hintText: "Enter Car Brand",
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 3.0),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter valid Brand";
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      controller: carModel,
                      decoration: InputDecoration(
                        labelText: 'Model',
                        hintText: "Enter Car Model",
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 3.0),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter valid Model";
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      controller: carDescription,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        hintText: "Enter Car Description",
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 3.0),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter valid Description";
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      controller: carYear,
                      decoration: InputDecoration(
                        labelText: 'Year',
                        hintText: "Enter Car Year",
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 3.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter valid Year";
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: carImage,
                      decoration: InputDecoration(
                        labelText: 'Image Url',
                        hintText: "Enter Car Image",
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 3.0),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter valid Image URL";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Go Back"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Car car = Car(
                              id: int.parse(carId.text),
                              brand: carBrand.text,
                              model: carModel.text,
                              year: int.parse(carYear.text),
                              description: carDescription.text,
                              imageUrl: carImage.text,
                            );
                            Provider.of<CarHelper>(context, listen: false)
                                .editCar(car, index);
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Edit"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
