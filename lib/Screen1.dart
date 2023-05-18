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
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Row(
                        children: [
                          Checkbox(
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
                          const SizedBox(width: 10),
                          Text(
                            items[index].name,
                            style:
                            const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: StepProgressIndicator(
                totalSteps: 100,
                currentStep: _currentSliderValue.toInt(),
                size: 30,
                selectedColor: commmonColor,
                unselectedColor: Colors.blueGrey,
              ),
            ),
            Slider(
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
              onChangeEnd: (double value) {
                setState(() {
                  _currentSliderValue = value;
                  changeColors(_currentSliderValue);
                });
              },
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: const [
                  Text("0", style:
                  TextStyle(color: Colors.white)),
                  Spacer(),
                  Text("25", style:
                  TextStyle(color: Colors.white)),
                  Spacer(),
                  Text("50", style:
                  TextStyle(color: Colors.white)),
                  Spacer(),
                  Text("75", style:
                  TextStyle(color: Colors.white)),
                  Spacer(),
                  Text("100", style:
                  TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Text("Remarks",
                style: TextStyle(color: Colors.white)),
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
                    backgroundColor: Colors.blue.withOpacity(0.4)),
                onPressed: () {
                  //TODO:Actions
                  List<Item> finalListThings = [];
                  for (Item item in items) {
                    final String name = item.name;
                    final bool isSelChanged = item.isSelected;
                    Item singleEntity = Item(name, isSelChanged);
                    finalListThings.add(singleEntity);
                  }
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                )
            )
          ],
        ),
      ),
    );
  }
}
