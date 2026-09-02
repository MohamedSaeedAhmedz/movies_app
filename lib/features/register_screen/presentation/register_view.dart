import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/core/bloc/locale/locale_bloc.dart';
import 'package:movies_app/core/localization/app_localizations.dart';
import 'package:movies_app/core/resources/app_color.dart';
import 'package:movies_app/core/resources/app_icon.dart';
import 'package:movies_app/core/resources/app_image.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

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

  int selectedAvatarIndex = 0;

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
              onPressed: () => Navigator.of(context).pop(),
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
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),

                    SizedBox(
                      height: 190,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        itemCount: avatars.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 12);
                        },
                        itemBuilder: (context, index) {
                          final isSelected =
                              selectedAvatarIndex == index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAvatarIndex = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 250,
                              ),
                              curve: Curves.easeOutBack,
                              width: isSelected ? 158 : 120,
                              height: isSelected ? 161 : 125,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? MColors.yellow
                                      : Colors.transparent,
                                  width: 3,
                                ),
                              ),
                              child: AnimatedScale(
                                duration: const Duration(
                                  milliseconds: 250,
                                ),
                                curve: Curves.easeOutBack,
                                scale: isSelected ? 1.0 : 0.75,
                                child: Image.asset(
                                  avatars[index],
                                  width: 158,
                                  height: 161,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
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

                    _buildTextField(
                      hintText: loc.name,
                      icon: MIcons.name,
                    ),

                    const SizedBox(height: 16),

                    _buildTextField(
                      hintText: loc.email,
                      icon: MIcons.mail,
                    ),

                    const SizedBox(height: 16),

                    _buildPasswordField(
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

                    _buildPasswordField(
                      hintText: loc.confirmPassword,
                      icon: MIcons.lock,
                      isHidden: isConfirmPasswordHidden,
                      onToggle: () {
                        setState(() {
                          isConfirmPasswordHidden =
                          !isConfirmPasswordHidden;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildTextField(
                      hintText: loc.phoneNumber,
                      icon: MIcons.call,
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
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
                          loc.createAccount,
                          style: const TextStyle(
                            color: MColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          loc.alreadyHaveAccount,
                          style: const TextStyle(
                            color: MColors.white,
                          ),
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

                    GestureDetector(
                      onTap: () {
                        final isEnglish =
                            localeState.locale.languageCode == 'en';

                        context.read<LocaleBloc>().add(
                          ChangeLocaleEvent(
                            languageCode: isEnglish ? 'ar' : 'en',
                          ),
                        );
                      },
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: SizedBox(
                          width: 92.11,
                          height: 37.89,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                width: 92.11,
                                height: 37.89,
                                decoration: BoxDecoration(
                                  color: MColors.black,
                                  borderRadius:
                                  BorderRadius.circular(18.94),
                                  border: Border.all(
                                    color: MColors.yellow,
                                    width: 2,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      MIcons.en,
                                      width: 22,
                                      height: 22,
                                    ),
                                    Image.asset(
                                      MIcons.arabic,
                                      width: 22,
                                      height: 22,
                                    ),
                                  ],
                                ),
                              ),
                              AnimatedPositioned(
                                duration: const Duration(
                                  milliseconds: 200,
                                ),
                                curve: Curves.easeInOut,
                                left:
                                localeState.locale.languageCode == 'en'
                                    ? 0
                                    : 53.45,
                                child: Container(
                                  width: 38.66,
                                  height: 37.89,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: MColors.black,
                                    border: Border.all(
                                      color: MColors.yellow,
                                      width: 3,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: ClipOval(
                                    child: Image.asset(
                                      localeState.locale.languageCode == 'en'
                                          ? MIcons.en
                                          : MIcons.arabic,
                                      width: 27,
                                      height: 27,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

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

  Widget _buildTextField({
    required String hintText,
    required String icon,
  }) {
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

  Widget _buildPasswordField({
    required String hintText,
    required String icon,
    required bool isHidden,
    required VoidCallback onToggle,
  }) {
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