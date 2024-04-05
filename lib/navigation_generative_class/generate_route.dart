import 'package:flutter/material.dart';
import 'package:flutter_car_details_application/car_brand_page/car_brand_page.dart';
import 'package:flutter_car_details_application/cars_show_page/cars_show_page.dart';
import 'package:flutter_car_details_application/checkout_page/car_checkout_page.dart';
import 'package:flutter_car_details_application/home_page/home_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  return switch (settings.name) {
    MyHomePage.pagePath =>
      PageBuilderLeftAnimation(page: const MyHomePage(), settings: settings),
    CarBrandPage.pagePath =>
      PageBuilderRightAnimation(page: const CarBrandPage(), settings: settings),
    CarShowPage.pagePath => PageBuilderTopDownAnimation(
        page: const CarShowPage(), settings: settings),
    CarCheckoutPage.pagePath => PageBuilderLeftAnimation(
        page: const CarCheckoutPage(), settings: settings),
    _ =>
      PageBuilderTopDownAnimation(page: const MyHomePage(), settings: settings),
  };
}

class PageBuilderLeftAnimation extends PageRouteBuilder {
  final Widget page;
  PageBuilderLeftAnimation({required this.page, super.settings})
      : super(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                        .animate(
                  CurvedAnimation(
                      parent: animation, curve: Curves.elasticInOut),
                ),
                child: child);
          },
          pageBuilder: (context, animation, secondaryAnimation) {
            return page;
          },
        );
}

class PageBuilderRightAnimation extends PageRouteBuilder {
  final Widget page;
  PageBuilderRightAnimation({required this.page, super.settings})
      : super(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                        .animate(
                  CurvedAnimation(
                      parent: animation, curve: Curves.elasticInOut),
                ),
                child: child);
          },
          pageBuilder: (context, animation, secondaryAnimation) {
            return page;
          },
        );
}

class PageBuilderTopDownAnimation extends PageRouteBuilder {
  final Widget page;

  PageBuilderTopDownAnimation({required this.page, super.settings})
      : super(
          transitionDuration: const Duration(seconds: 2),
          reverseTransitionDuration: const Duration(seconds: 2),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
                        .animate(
                  CurvedAnimation(
                      parent: animation, curve: Curves.elasticInOut),
                ),
                child: child);
          },
          pageBuilder: (context, animation, secondaryAnimation) {
            return page;
          },
        );
}
