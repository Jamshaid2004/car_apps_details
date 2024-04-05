import 'package:flutter/material.dart';
import 'package:flutter_car_details_application/cars_show_page/car_view_model.dart';

class CarView extends StatelessWidget {
  const CarView({super.key, required this.size, required this.currentCar});
  final double size;
  final CarViewModel currentCar;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            color: Colors.grey,
            height: size * 0.4,
            child: Image.asset(
              currentCar.imageResouceId,
              width: size * 0.4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              currentCar.carName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
