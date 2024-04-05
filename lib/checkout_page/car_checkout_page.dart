import 'package:flutter/material.dart';

import 'package:flutter_car_details_application/cars_show_page/car_view_model.dart';

class CarCheckoutPage extends StatelessWidget {
  static const String pagePath = '/cars_checkout_page';
  const CarCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    CarViewModel currentCar =
        ModalRoute.of(context)!.settings.arguments as CarViewModel;
    onClick() {
      Navigator.of(context).pop(currentCar.carName);
    }

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
              opacity: 0.3,
              child: Container(
                color: Colors.grey,
              )),
          Image.asset(
            currentCar.imageResouceId,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    currentCar.carName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                        shadowColor: MaterialStatePropertyAll(Colors.grey)),
                    onPressed: onClick,
                    child: const Text(
                      'Checkout',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
