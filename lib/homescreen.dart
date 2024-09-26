import 'package:flutter/material.dart';
import 'package:titanic_app/bad_ending.dart';
import 'package:titanic_app/components/custom_button.dart';
import 'package:titanic_app/components/custom_dropdown.dart';
import 'package:titanic_app/components/custom_textfield.dart';
import 'package:titanic_app/good_ending.dart';
import 'package:titanic_app/theme/design_system.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController pclassController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController sibspController = TextEditingController();
  final TextEditingController parchController = TextEditingController();
  final TextEditingController fareController = TextEditingController();
  List<String> options = ["Masculino", "Feminino"];
  String currentOption = '';
  final TextEditingController embarkedController = TextEditingController();
  bool isLoading = false;

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
      body: Stack(
        children: [
          ListView(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Text(
                  "Você sobreviveria ao Titanic?",
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFFDDFFC9),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    CustomDropdownField(
                      label: "Classe de Embarque",
                      entries: const [
                        DropdownMenuEntry(value: 1, label: '1ª Classe'),
                        DropdownMenuEntry(value: 2, label: '2ª Classe'),
                        DropdownMenuEntry(value: 3, label: '3ª Classe'),
                      ],
                      controller: pclassController,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
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
                    CustomTextField(
                        myLabel: 'Idade', controller: ageController),
                    CustomTextField(
                        myLabel: 'Número de Irmãos/Cônjuges',
                        controller: sibspController),
                    CustomTextField(
                        myLabel: 'Número de Pais/Filhos',
                        controller: parchController),
                    CustomTextField(
                        myLabel: 'Tarifa Paga', controller: fareController),
                    CustomDropdownField(
                      label: "Porto de Embarque",
                      entries: const [
                        DropdownMenuEntry(value: "S", label: 'Southampton'),
                        DropdownMenuEntry(value: "C", label: 'Cherbourg'),
                        DropdownMenuEntry(value: "Q", label: 'Queenstown'),
                      ],
                      controller: embarkedController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: CustomButton(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });

                          final passengerData = {
                            'pclass': tryParsePClass(pclassController.text),
                            'sex': currentOption == 'Masculino'
                                ? 'male'
                                : 'female',
                            'age': double.tryParse(ageController.text) ?? 0,
                            'sibsp': int.tryParse(sibspController.text) ?? 0,
                            'parch': int.tryParse(parchController.text) ?? 0,
                            'fare': double.tryParse(fareController.text) ?? 0,
                            'embarked':
                                tryParseEmbarked(embarkedController.text),
                          };

                          try {
                            final response = await http.post(
                              Uri.parse('http://147.182.166.181:8080/predict'),
                              headers: {'Content-Type': 'application/json'},
                              body: jsonEncode(passengerData),
                            );

                            if (response.statusCode == 200) {
                              final result = jsonDecode(response.body);
                              final survived =
                                  result['prediction'] == "Sobreviveu";

                              if (survived) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const GoodEndingScreen(),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BadEndingScreen(),
                                  ),
                                );
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Erro'),
                                  content: const Text(
                                      'Falha ao prever. Tente novamente.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Erro'),
                                content: const Text(
                                    'Ocorreu um erro. Tente novamente.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}

int tryParsePClass(String pclass) {
  if (pclass == '1ª Classe') {
    return 1;
  } else if (pclass == '2ª Classe') {
    return 2;
  } else if (pclass == '3ª Classe') {
    return 3;
  } else {
    return 1;
  }
}

String tryParseEmbarked(String embarked) {
  if (embarked == 'Southampton') {
    return 'S';
  } else if (embarked == 'Cherbourg') {
    return 'C';
  } else if (embarked == 'Queenstown') {
    return 'Q';
  } else {
    return 'S';
  }
}
