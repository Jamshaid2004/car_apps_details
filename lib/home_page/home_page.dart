import 'package:flutter/material.dart';

import 'package:flutter_car_details_application/car_brand_page/car_brand_page.dart';

import 'package:flutter_car_details_application/home_page/let_start_button.dart';
import 'package:flutter_car_details_application/home_page/my_name_input_field.dart';

class MyHomePage extends StatefulWidget {
  static const String pagePath = '/';
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final usernameKey = GlobalKey<FormState>();

  late TextEditingController _usernameController;
  late String username;
  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
  }

  onStartClick() {
    if (usernameKey.currentState!.validate()) {
      username = _usernameController.text;
      Navigator.of(context)
          .pushNamed(CarBrandPage.pagePath, arguments: username);
    }
  }

  @override
  Widget build(BuildContext context) {
    const wallpaper = 'assets/images/background_images/background_two.jpeg';
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.55,
            child: Image.asset(
              wallpaper,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: usernameKey,
                  child: UserNameInputWidget(
                    controller: _usernameController,
                  ),
                ),
                const SizedBox(height: 30),
                StartButtonWidget(onStartClick: onStartClick),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
