import 'package:flutter/material.dart';
import 'package:titanic_app/components/custom_textfield.dart';

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
        title: const Center(
          child: Text("Prever Sobrevivência no Titanic"),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // CustomTextField(myLabel: 'myLabel'),
                const CustomTextField(myLabel: 'Classe do Passageiro'),
                ListTile(
                  title: Text("Masculino"),
                  leading: Radio(
                    activeColor: Color(0xFF5A754A),
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
                  title: Text("Feminino"),
                  leading: Radio(
                    activeColor: Color(0xFF5A754A),
                    value: options[1],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    },
                  ),
                ),
                CustomTextField(myLabel: 'Idade'),
                CustomTextField(myLabel: 'Número de Irmãos/Cônjuges'),
                CustomTextField(myLabel: 'Número de Pais/Filhos'),
                CustomTextField(myLabel: 'Tarifa Paga'),
                CustomTextField(myLabel: 'Porto de Embarque'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
