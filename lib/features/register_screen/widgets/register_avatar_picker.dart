import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/app_color.dart';

class RegisterAvatarPicker extends StatelessWidget {
  final List<String> avatars;
  final int selectedAvatarIndex;
  final ValueChanged<int> onAvatarSelected;

  const RegisterAvatarPicker({
    super.key,
    required this.avatars,
    required this.selectedAvatarIndex,
    required this.onAvatarSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          final isSelected = selectedAvatarIndex == index;

          return GestureDetector(
            onTap: () => onAvatarSelected(index),
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
    );
  }
}