import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/core/bloc/locale/locale_bloc.dart';
import 'package:movies_app/core/localization/app_localizations.dart';
import 'package:movies_app/core/resources/app_color.dart';
import 'package:movies_app/core/resources/app_icon.dart';
import 'package:movies_app/core/resources/app_image.dart';

import '../widgets/register_avatar_picker.dart';
import '../widgets/register_button.dart';
import '../widgets/register_language_switch.dart';
import '../widgets/register_password_field.dart';
import '../widgets/register_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  int selectedAvatarIndex = 0;

  final List<String> avatars = [
    MImages.avatar1,
    MImages.avatar2,
    MImages.avatar3,
    MImages.avatar4,
    MImages.avatar5,
    MImages.avatar6,
    MImages.avatar7,
    MImages.avatar8,
    MImages.avatar9,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, localeState) {
        final loc = AppLocalizations.of(context)!;

        return Scaffold(
          backgroundColor: MColors.black,
          appBar: AppBar(
            backgroundColor: MColors.black,
            elevation: 0,
            leading: IconButton(
              icon: Image.asset(
                MIcons.back,
                width: 24,
                height: 24,
                color: MColors.yellow,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              loc.register,
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),

                    RegisterAvatarPicker(
                      avatars: avatars,
                      selectedAvatarIndex: selectedAvatarIndex,
                      onAvatarSelected: (index) {
                        setState(() {
                          selectedAvatarIndex = index;
                        });
                      },
                    ),

                    const SizedBox(height: 4),

                    Text(
                      loc.avatar,
                      style: const TextStyle(
                        color: MColors.white,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 24),

                    RegisterTextField(hintText: loc.name, icon: MIcons.name),

                    const SizedBox(height: 16),

                    RegisterTextField(hintText: loc.email, icon: MIcons.mail),

                    const SizedBox(height: 16),

                    RegisterPasswordField(
                      hintText: loc.password,
                      icon: MIcons.lock,
                      isHidden: isPasswordHidden,
                      onToggle: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    RegisterPasswordField(
                      hintText: loc.confirmPassword,
                      icon: MIcons.lock,
                      isHidden: isConfirmPasswordHidden,
                      onToggle: () {
                        setState(() {
                          isConfirmPasswordHidden = !isConfirmPasswordHidden;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    RegisterTextField(
                      hintText: loc.phoneNumber,
                      icon: MIcons.call,
                    ),

                    const SizedBox(height: 24),

                    RegisterButton(text: loc.createAccount, onPressed: () {}),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          loc.alreadyHaveAccount,
                          style: const TextStyle(color: MColors.white),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            loc.login,
                            style: const TextStyle(
                              color: MColors.yellow,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    RegisterLanguageSwitch(localeState: localeState),

                    const SizedBox(height: 20),
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
