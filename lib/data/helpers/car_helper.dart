import 'package:flutter/material.dart';
import 'package:flutter_learning/data/models/car_model.dart';

class CarHelper extends ChangeNotifier {
  List<Car> carList = [];
  void addCar(Car car) {
    carList.insert(0, car);
    notifyListeners();
  }

  void removeCar(Car car) {
    // DUMMY_DATA.removeWhere((element) => element.id == id);
    carList.remove(car);
    notifyListeners();
  }

  void editCar(Car car, int index) {
    debugPrint('movieTitle: $car index-$index');
    carList.replaceRange(index, index + 1, [car]);
    notifyListeners();
  }
}
