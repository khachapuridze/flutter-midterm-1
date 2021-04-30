import 'package:flutter/material.dart';
import 'package:flutter_learning/data/models/car_model.dart';

class CarDetailWidget extends StatelessWidget {
  const CarDetailWidget({
    Key key,
    @required this.screenSize,
    @required this.args,
  }) : super(key: key);

  final Size screenSize;
  final Car args;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              FadeInImage(
                width: double.infinity,
                height: screenSize.height * 0.4,
                fit: BoxFit.contain,
                placeholder: AssetImage("assets/images/car_placeholder.png"),
                image: NetworkImage(args.imageUrl),
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Brand:",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    args.brand,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Model:",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    args.model,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Year:",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    args.year.toString(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  args.description,
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
    );
  }
}
