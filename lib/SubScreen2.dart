import 'package:flutter/material.dart';

class CarModel {
  String carName;
  List<String> carPicArray;

  CarModel({required this.carName, required this.carPicArray});
}

class CarsScreen extends StatefulWidget {
  const CarsScreen({Key? key}) : super(key: key);

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {

  List <String> dropList = ["A", "B", "C"];
  late String dropDownValue;

  @override
  void initState() {
    super.initState();
    dropDownValue = dropList.first;
  }

  // List<CarModel> carsList = [
  //   CarModel(carName: "A", carPicArray: ["ABC", "BVS", "FGFGHFGH"]),
  //   CarModel(carName: "B", carPicArray: ["ABC", "BVS", "FGFGHFGH"]),
  //   CarModel(carName: "C", carPicArray: ["ABC", "BVS", "FGFGHFGH"])
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                const Text("Select Vehicle Class"),
                Row(
                  children: [
                    DropdownButton<String>(
                      value: dropDownValue,
                      elevation: 16,
                      icon: null,
                      style: const TextStyle(color: Colors.deepPurpleAccent),
                      underline: Container(
                        height: 2,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.deepPurpleAccent, width: 2),
                          ),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropDownValue = value!;
                        });
                      },
                      items: dropList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
