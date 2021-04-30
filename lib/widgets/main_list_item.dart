import 'package:flutter/material.dart';

class MainListItem extends StatelessWidget {
  final String imageUrl;
  final String brand;
  final String model;
  final String year;
  final String description;

  MainListItem(
      {this.imageUrl, this.brand, this.model, this.year, this.description});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          children: [
            Container(
              height: 200,
              child: FadeInImage(
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/images/car_placeholder.png"),
                image: NetworkImage(imageUrl),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "$brand - $model",
              style: TextStyle(fontSize: 20.0, color: Colors.lightBlue),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text("year -$year")
          ],
        ),
      ),
    );
  }
}
