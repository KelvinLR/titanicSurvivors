import 'package:flutter/material.dart';
import 'package:titanic_app/theme/design_system.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.myLabel});

  final String myLabel;

  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.sizeOf(context).width;
    double contextHeight = MediaQuery.sizeOf(context).height;

    return Container(
      width: contextWidth * (283 / 360),
      height: contextHeight * (40 / 800),
      decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: EdgeInsets.only(
            left: contextWidth * (18 / 360),
            bottom: contextHeight * (10 / 800),
            top: contextHeight * (10 / 800),
          ),
          label: Text(
            myLabel,
            style: TitanicAppFonts.formTextStyle,
          ),
        ),
      ),
    );
  }
}
