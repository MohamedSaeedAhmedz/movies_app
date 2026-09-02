import 'package:flutter/material.dart';
import 'package:movies_app/core/localization/app_localizations.dart';
import 'package:movies_app/core/resources/app_color.dart';

class VerifyEmailButton extends StatelessWidget {
  const VerifyEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    var loc = AppLocalizations.of(context)!;

    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MColors.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {},
        child: Text(
          loc.verifyEmail,
          style: const TextStyle(
            color: MColors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}