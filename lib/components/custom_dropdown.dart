import 'package:flutter/material.dart';
import 'package:titanic_app/theme/design_system.dart';

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    required this.label,
    required this.entries,
    required this.controller,
  });

  final String label;
  final List<DropdownMenuEntry> entries;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.sizeOf(context).width;
    double contextHeight = MediaQuery.sizeOf(context).height;

    return DecoratedBox(
      decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: DropdownMenu(
        controller: controller,
        label: Text(
          label,
          style: TitanicAppFonts.formTextStyle,
        ),
        dropdownMenuEntries: entries,
        width: contextWidth * (283 / 360),
        menuHeight: contextHeight * (264 / 800),
        menuStyle: const MenuStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          elevation: WidgetStatePropertyAll(1),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          constraints: BoxConstraints(
              minHeight: contextHeight * (40 / 800),
              maxHeight: contextHeight * (40 / 800)),
          contentPadding: EdgeInsets.only(
            left: contextWidth * (18 / 360),
            bottom: contextHeight * (10 / 800),
            top: contextHeight * (10 / 800),
          ),
        ),
      ),
    );
  }
}
