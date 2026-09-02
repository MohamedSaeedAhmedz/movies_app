import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/app_color.dart';

class RegisterTextField extends StatelessWidget {
  final String hintText;
  final String icon;

  const RegisterTextField({
    super.key,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: MColors.white,
      ),
      cursorColor: MColors.yellow,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(
            icon,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: MColors.white,
        ),
        filled: true,
        fillColor: MColors.dgrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}