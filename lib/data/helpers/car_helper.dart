import 'package:flutter_learning/data/models/dummy_data.dart';
import 'package:flutter_learning/data/models/car_model.dart';

class CarHelper {
  void addCar(Car car) {
    DUMMY_DATA.insert(0, car);
  }

  void removeCar(Car car) {
    // DUMMY_DATA.removeWhere((element) => element.id == id);
    DUMMY_DATA.remove(car);
  }

  void editCar(Car car, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [car]);
  }
}
