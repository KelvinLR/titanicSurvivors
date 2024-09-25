import 'package:flutter/material.dart';
import 'package:titanic_app/components/custom_button.dart';
import 'package:titanic_app/components/custom_dropdown.dart';
import 'package:titanic_app/components/custom_textfield.dart';
import 'package:titanic_app/theme/design_system.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> options = ["Masculino", "Feminino"];
  String currentOption = '';
  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.sizeOf(context).width;
    double contextHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5FFEF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFCEFBB3),
        title: Center(
          child: Text(
            "Prever Sobrevivência no Titanic",
            style: TitanicAppFonts.appBarTextStyle,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: contextWidth * (34 / 360),
              right: contextWidth * (34 / 360),
              top: contextHeight * (23 / 800),
              bottom: contextHeight * (23 / 800),
            ),
            child: const Text(
              "Se você estivesse no Titanic, quais seriam suas chances de sobreviver?",
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: contextWidth * (334 / 360),
            height: contextHeight * (481 / 800),
            decoration: const BoxDecoration(
                color: Color(0xFFDDFFC9),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                contextWidth * (25.5 / 360),
                contextHeight * (19.5 / 800),
                contextWidth * (25.5 / 360),
                contextHeight * (19.5 / 800),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // CustomTextField(myLabel: 'myLabel'),
                  const CustomDropdownField(
                    label: "Classe de Embarque",
                    entries: [
                      DropdownMenuEntry(value: 1, label: '1ª Classe'),
                      DropdownMenuEntry(value: 2, label: '2ª Classe'),
                      DropdownMenuEntry(value: 3, label: '3ª Classe'),
                    ],
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    minTileHeight: contextHeight * (20 / 800),
                    title: Text(
                      "Masculino",
                      style: TitanicAppFonts.formTextStyle,
                    ),
                    leading: Radio(
                      activeColor: const Color(0xFF5A754A),
                      value: options[0],
                      groupValue: currentOption,
                      onChanged: (value) {
                        setState(() {
                          currentOption = value.toString();
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    minTileHeight: contextHeight * (20 / 800),
                    title: Text(
                      "Feminino",
                      style: TitanicAppFonts.formTextStyle,
                    ),
                    leading: Radio(
                      activeColor: const Color(0xFF5A754A),
                      value: options[1],
                      groupValue: currentOption,
                      onChanged: (value) {
                        setState(() {
                          currentOption = value.toString();
                        });
                      },
                    ),
                  ),
                  const CustomTextField(myLabel: 'Idade'),
                  const CustomTextField(myLabel: 'Número de Irmãos/Cônjuges'),
                  const CustomTextField(myLabel: 'Número de Pais/Filhos'),
                  const CustomTextField(myLabel: 'Tarifa Paga'),
                  const CustomDropdownField(
                    label: "Porto de Embarque",
                    entries: [
                      DropdownMenuEntry(value: "S", label: 'Southampton'),
                      DropdownMenuEntry(value: "C", label: 'Cherbourg'),
                      DropdownMenuEntry(value: "Q", label: 'Queenstown'),
                    ],
                  ),
                  const CustomButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
