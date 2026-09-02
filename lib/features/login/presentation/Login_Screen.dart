import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/bloc/locale/locale_bloc.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/resources/app_color.dart';
import '../../../core/resources/app_icon.dart';
import '../../../core/resources/app_image.dart';
import '../../../core/routes/AppRoutes.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    var loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: MColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Image.asset(
                  MImages.logo2,
                  width: 121,
                  height: 118,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 69),
                TextField(
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
                    hintStyle: const TextStyle(color: MColors.white),
                    filled: true,
                    fillColor: MColors.dgrey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: isPasswordHidden,
                  style: const TextStyle(color: MColors.white),
                  cursorColor: MColors.yellow,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        MIcons.lock,
                        width: 24,
                        height: 24,
                        color: MColors.white,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: MColors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                    ),
                    hintText: loc.password,
                    hintStyle: const TextStyle(color: MColors.white),
                    filled: true,
                    fillColor: MColors.dgrey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.register);
                    },
                    child: Text(
                      loc.forgetPassword,
                      style: const TextStyle(color: MColors.yellow),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
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
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.updateProfile);
                    },
                    child: Text(
                      loc.login,
                      style: const TextStyle(
                        color: MColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        loc.dontHaveAccount,
                        style: const TextStyle(color: MColors.white),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          loc.createOne,
                          style: const TextStyle(
                            color: MColors.yellow,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(color: MColors.yellow, thickness: 0.8),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          loc.or,
                          style: const TextStyle(
                            color: MColors.yellow,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(color: MColors.yellow, thickness: 0.8),
                      ),
                    ],
                  ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(MIcons.google, width: 28, height: 28),
                        const SizedBox(width: 8),
                        Text(
                          loc.loginWithGoogle,
                          style: const TextStyle(
                            color: MColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                BlocBuilder<LocaleBloc, LocaleState>(
                  builder: (context, state) {
                    final bool isEnglish = state.locale.languageCode == 'en';

                    return Directionality(
                      textDirection: TextDirection.ltr,
                      child: GestureDetector(
                        onTap: () {
                          context.read<LocaleBloc>().add(
                            ChangeLocaleEvent(
                              languageCode: isEnglish ? 'ar' : 'en',
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 92.11,
                          height: 37.89,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 92.11,
                                  height: 37.89,
                                  decoration: BoxDecoration(
                                    color: MColors.black,
                                    borderRadius: BorderRadius.circular(18.94),
                                    border: Border.all(
                                      color: MColors.yellow,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
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
                                          width: 22.0,
                                          height: 22.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                left: isEnglish ? 0 : 53.45,
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
                                      isEnglish ? MIcons.en : MIcons.arabic,
                                      width: 27.0,
                                      height: 27.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}