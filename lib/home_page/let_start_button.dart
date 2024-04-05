import 'package:flutter/material.dart';

class StartButtonWidget extends StatelessWidget {
  final void Function()? onStartClick;
  const StartButtonWidget({super.key,required this.onStartClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue)),
            onPressed: onStartClick,
            child: const Text(
              'Let Start',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
  }
}