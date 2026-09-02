import 'package:flutter/material.dart';
import 'package:movies_app/core/localization/app_localizations.dart';
import 'package:movies_app/core/resources/app_color.dart';
import 'package:movies_app/core/resources/app_icon.dart';

class ForgetPasswordForm extends StatelessWidget {
  final TextEditingController emailController;

  const ForgetPasswordForm({
    super.key,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    var loc = AppLocalizations.of(context)!;

    return TextField(
      controller: emailController,
      style: const TextStyle(color: MColors.white),
      cursorColor: MColors.yellow,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            MIcons.mail,
            width: 24,
            height: 24,
            color: MColors.white,
          ),
        ),
        hintText: loc.email,
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