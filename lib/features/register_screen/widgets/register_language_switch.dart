import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/core/bloc/locale/locale_bloc.dart';
import 'package:movies_app/core/resources/app_color.dart';
import 'package:movies_app/core/resources/app_icon.dart';

class RegisterLanguageSwitch extends StatelessWidget {
  final LocaleState localeState;

  const RegisterLanguageSwitch({
    super.key,
    required this.localeState,
  });

  @override
  Widget build(BuildContext context) {
    final isEnglish =
        localeState.locale.languageCode == 'en';

    return GestureDetector(
      onTap: () {
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
                  borderRadius: BorderRadius.circular(18.94),
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
                      isEnglish
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
    );
  }
}