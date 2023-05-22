import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'Models.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final List<Item> items = [
    Item("BodyCover", false),
    Item("RegistrationPaper", false),
    Item("SpareWheel", false),
    Item("CD", false),
    Item("Idol", false),
    Item("Pen Drive", false),
    Item("Service Book", false),
    Item("Jack", false),
    Item("First Aids Kit", false),
    Item("Hub Caps", false),
    Item("Bonnet Star", false),
    Item("Tool Kit", false),
    Item("Mats", false),
    Item("Key Chain", false),
    Item("Test Mats", false),
  ];


  final TextEditingController finalRemarks1 = TextEditingController();
  double _currentSliderValue = 0;
  int currentStep = 0;
  Color commmonColor = Colors.red;

  void changeColors(double values){
    if (values.toInt() > 50) {
      commmonColor = Colors.green;
    } else if (values.toInt() > 25 &&
        values.toInt() <= 50) {
      commmonColor = Colors.yellow;
    } else if (values.toInt() > 0 && values.toInt() <= 25) {
      commmonColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.white;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      // color: Color.fromARGB(44, 255, 255, 255),
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.6,
                            child: Checkbox(
                              checkColor: Colors.black,
                              fillColor:
                              MaterialStateProperty.resolveWith(
                                  getColor),
                              value: items[index].isSelected,
                              shape: const CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  items[index].isSelected = value!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 5),
                          generalText(text: items[index].name),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            slider(),

            const SizedBox(
              height: 100
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            generalText(text: "Remarks"),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                  controller: finalRemarks1,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  )),
            ),
            const SizedBox(width: 10),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue.withOpacity(0.5)),
                onPressed: () {
                  List<Item> finalListThings = [];
                  for (Item item in items) {
                    final String name = item.name;
                    final bool isSelChanged = item.isSelected;
                    Item singleEntity = Item(name, isSelChanged);
                    finalListThings.add(singleEntity);
                  }
                },
                child: generalText(text: "Save"),
            )
          ],
        ),
      ),
    );
  }

  Padding slider() {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
              children: <Widget>[
                Stack(
              children: <Widget>[
                StepProgressIndicator(
                  totalSteps: 100,
                  currentStep: _currentSliderValue.toInt(),
                  size: 40,
                  selectedColor: commmonColor,
                  unselectedColor: Colors.blueGrey,
                ),
            Slider(
              activeColor: const Color.fromARGB(0, 0, 0, 0),
              inactiveColor: const Color.fromARGB(0, 0, 0, 0),
              // secondaryActiveColor: const Color.fromARGB(0, 0, 0, 0),
              // thumbColor: const Color(0x00000000),
              value: _currentSliderValue,
              max: 100,
              divisions: 100,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                  changeColors(_currentSliderValue);
                });
              },
            ),
            ],
            ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  generalText(text: "0"),
                  generalText(text: "25%"),
                  generalText(text: "50%"),
                  generalText(text: "75%"),
                  generalText(text: "100%"),
                ],
              ),
              ],
            ),
    );
  }

  Text generalText({String? text}) {
    return Text("$text", style: const TextStyle(color: Colors.white,fontSize: 20));
  }
}
