import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/app_color.dart';

class RegisterPasswordField extends StatelessWidget {
  final String hintText;
  final String icon;
  final bool isHidden;
  final VoidCallback onToggle;

  const RegisterPasswordField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.isHidden,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isHidden,
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
        suffixIcon: IconButton(
          onPressed: onToggle,
          icon: Icon(
            isHidden
                ? Icons.visibility_off
                : Icons.visibility,
            color: MColors.white,
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