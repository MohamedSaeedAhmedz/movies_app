import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/bloc/locale/locale_bloc.dart';
import 'package:movies_app/core/localization/app_localizations.dart';
import 'package:movies_app/core/resources/app_color.dart';
import 'package:movies_app/core/resources/app_image.dart';

import '../widgets/forget_password_form.dart';
import '../widgets/verify_email_button.dart';


class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, localeState) {
        var loc = AppLocalizations.of(context)!;

        return Scaffold(
          backgroundColor: MColors.black,
          appBar: AppBar(
            backgroundColor: MColors.black,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: MColors.yellow,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              loc.forgetPassword,
              style: const TextStyle(
                color: MColors.yellow,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Center(
                      child: SizedBox(
                        width: 280,
                        height: 280,
                        child: Image.asset(
                          MImages.forgot,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ForgetPasswordForm(
                      emailController: _emailController,
                    ),
                    const SizedBox(height: 24),
                    const VerifyEmailButton(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}