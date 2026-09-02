import 'package:flutter/material.dart';
import 'package:movies_app/core/localization/app_localizations.dart';
import 'package:movies_app/core/resources/app_color.dart';
import 'package:movies_app/core/resources/app_icon.dart';
import 'package:movies_app/core/resources/app_image.dart';
import 'package:movies_app/features/forgetpassword/presentation/forgetpassword_screen.dart';


class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  final TextEditingController _nameController =
  TextEditingController(text: "Mohamed_Elsayed");

  final TextEditingController _phoneController =
  TextEditingController(text: "01200000000");

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
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

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
          "Update Profile",
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
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      _buildAvatarHeader(localizations),
                      const SizedBox(height: 24),
                      _buildTextField(
                        controller: _nameController,
                        icon: MIcons.name,
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        controller: _phoneController,
                        icon: MIcons.call,
                      ),
                      const SizedBox(height: 20),
                      _buildResetPasswordButton(localizations),
                    ],
                  ),
                ),
              ),
              _buildDeleteAccountButton(localizations),
              const SizedBox(height: 12),
              _buildUpdateDataButton(localizations),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarHeader(AppLocalizations localizations) {
    return Column(
      children: [
        GestureDetector(
          onTap: _showAvatarBottomSheet,
          child: SizedBox(
            width: 150,
            height: 150,
            child: CircleAvatar(
              backgroundColor: MColors.dgrey,
              backgroundImage: AssetImage(
                avatars[selectedAvatarIndex],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _showAvatarBottomSheet,
          child: Text(
            localizations.pickAvatar,
            style: const TextStyle(
              color: MColors.yellow,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  void _showAvatarBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: MColors.black,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        final localizations = AppLocalizations.of(context)!;

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              20,
              20,
              20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: MColors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  localizations.pickAvatar,
                  style: const TextStyle(
                    color: MColors.yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: avatars.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 108 / 105,
                  ),
                  itemBuilder: (context, index) {
                    final bool isSelected =
                        selectedAvatarIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAvatarIndex = index;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 108,
                        height: 105,
                        decoration: BoxDecoration(
                          color: MColors.dgrey,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? MColors.yellow
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 86,
                            height: 86,
                            child: CircleAvatar(
                              backgroundColor: MColors.dgrey,
                              backgroundImage: AssetImage(
                                avatars[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String icon,
  }) {
    return TextField(
      controller: controller,
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
            color: MColors.white,
          ),
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

  Widget _buildResetPasswordButton(
      AppLocalizations localizations,
      ) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ForgetPasswordView(),
            ),
          );
        },
        child: Text(
          localizations.resetPassword,
          style: const TextStyle(
            color: MColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteAccountButton(
      AppLocalizations localizations,
      ) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {},
        child: Text(
          localizations.deleteAccount,
          style: const TextStyle(
            color: MColors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildUpdateDataButton(
      AppLocalizations localizations,
      ) {
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
          localizations.updateData,
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