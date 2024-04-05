import 'package:flutter/material.dart';
import 'package:flutter_car_details_application/car_brand_page/car_brand_model_item.dart';
import 'package:flutter_car_details_application/cars_show_page/car_view.dart';
import 'package:flutter_car_details_application/cars_show_page/cars_list_map.dart';
import 'package:flutter_car_details_application/checkout_page/car_checkout_page.dart';

class CarShowPage extends StatelessWidget {
  static const String pagePath = '/cars_show_page';

  const CarShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CarBrandModelItem(:imageResouceId, :carBrandName) =
        ModalRoute.of(context)!.settings.arguments as CarBrandModelItem;
    final carList = carsListMap[carBrandName];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple.shade100,
        title: Text(
          carBrandName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.5,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  width: double.infinity,
                  imageResouceId,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          ListWheelScrollView.useDelegate(
            itemExtent: 400,
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: carList?.length,
              builder: (context, index) {
                final size = MediaQuery.of(context).size.height;
                final currentCar = carList![index];
                onCarClick() async {
                  final value = await Navigator.of(context).pushNamed(
                    CarCheckoutPage.pagePath,
                    arguments: currentCar,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          '${value as String} is currently unavailable.')));
                }

                return GestureDetector(
                    onTap: onCarClick,
                    child: CarView(size: size, currentCar: currentCar));
              },
            ),
          ),
        ],
      ),
    );
  }
}
