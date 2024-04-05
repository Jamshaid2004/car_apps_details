import 'package:flutter/material.dart';

import 'package:flutter_car_details_application/car_brand_page/car_brand_list.dart';
import 'package:flutter_car_details_application/car_brand_page/car_brand_model_item.dart';
import 'package:flutter_car_details_application/car_brand_page/car_brand_single_item.dart';

class CarBrandPage extends StatelessWidget {
  static const String pagePath = '/car_brand_page';
  const CarBrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundImageSource =
        'assets/images/background_images/background_one.jpeg';
    final screenSize = MediaQuery.of(context).size;
    var arguments = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        bottomOpacity: 1,
        elevation: 3,
        title: Text(
          'Welcome, $arguments !',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              backgroundImageSource,
              fit: BoxFit.fill,
              width: screenSize.width,
              height: screenSize.height,
            ),
          ),
          GridView.builder(
            itemCount: carBrandDummyList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              CarBrandModelItem currentItem = carBrandDummyList[index];
              return CarBrandSingleItem(
                currentItem: currentItem,
                screenSize: screenSize,
              );
            },
          ),
        ],
      ),
    );
  }
}
