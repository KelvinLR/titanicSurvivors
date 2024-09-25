import 'package:flutter/material.dart';
import 'package:titanic_app/theme/design_system.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.sizeOf(context).width;
    double contextHeight = MediaQuery.sizeOf(context).height;
    return SizedBox(
      width: contextWidth * (283 / 360),
      height: contextHeight * (59 / 800),
      child: Material(
        color: const Color(0xffB6FF89),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {},
          child: Center(
            child: Text(
              "Prever Sobrevivência",
              style: TitanicAppFonts.formTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
