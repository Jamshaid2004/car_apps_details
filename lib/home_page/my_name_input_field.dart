import 'package:flutter/material.dart';

class UserNameInputWidget extends StatelessWidget {
  const UserNameInputWidget({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        validator: (value) {
          return value == '' ? 'Required Field is Empty' : null;
        },
        controller: controller,
        style: const TextStyle(color: Colors.black, fontSize: 15),
        maxLength: 10,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: 'UserName',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            gapPadding: 5,
          ),
        ),
      ),
    );
  }
}
