import 'package:flutter/material.dart';

import 'package:flutter_car_details_application/home_page/home_page.dart';
import 'package:flutter_car_details_application/navigation_generative_class/generate_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: MyHomePage.pagePath,
      title: 'Car Details',
    );
  }
}
