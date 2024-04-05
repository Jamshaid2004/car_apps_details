import 'package:flutter/material.dart';
import 'package:flutter_car_details_application/car_brand_page/car_brand_model_item.dart';
import 'package:flutter_car_details_application/cars_show_page/cars_show_page.dart';

class CarBrandSingleItem extends StatefulWidget {
  final CarBrandModelItem currentItem;
  final Size screenSize;
  const CarBrandSingleItem(
      {super.key, required this.currentItem, required this.screenSize});

  @override
  State<CarBrandSingleItem> createState() => _CarBrandSingleItemState();
}

class _CarBrandSingleItemState extends State<CarBrandSingleItem> {
  onClick() {
    Navigator.of(context)
        .pushNamed(CarShowPage.pagePath, arguments: widget.currentItem);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          width: widget.screenSize.width * 0.5,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2.5),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  fit: BoxFit.fill,
                  widget.currentItem.imageResouceId,
                  scale: 0.75,
                ),
              ),
              Text(
                widget.currentItem.carBrandName,
                style: TextStyle(
                    fontSize: widget.screenSize.width * 0.03,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
