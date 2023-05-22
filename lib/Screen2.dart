import 'package:flutter/material.dart';

import 'Models.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  Color selColor = Colors.grey;
  final TextEditingController finalRemarks = TextEditingController();

  final List<InteractiveModel> items2 = [
    InteractiveModel(
        name: "Fluid Level and Quality",
        message: TextEditingController(),
        numStatus: 0.0),
    InteractiveModel(
        name: "Hose connections and leakage",
        message: TextEditingController(),
        numStatus: 0.0),
    InteractiveModel(
        name: "V-Belt Condition",
        message: TextEditingController(),
        numStatus: 0.0),
    InteractiveModel(
        name: "Battery Condition",
        message: TextEditingController(),
        numStatus: 0.0),
    InteractiveModel(
        name: "Power Window Operation",
        message: TextEditingController(),
        numStatus: 0.0),
    InteractiveModel(
        name: "Horn Operation",
        message: TextEditingController(),
        numStatus: 0.0),
    InteractiveModel(
        name: "Seat Belt Operation",
        message: TextEditingController(),
        numStatus: 0.0),
    InteractiveModel(
        name: "Interior illumination",
        message: TextEditingController(),
        numStatus: 0.0),
    InteractiveModel(
        name: "Radio Options",
        message: TextEditingController(),
        numStatus: 0.0),
    InteractiveModel(
        name: "ORVMs Operation",
        message: TextEditingController(),
        numStatus: 0.0),
    InteractiveModel(
        name: "Wiper and windshield washer operation",
        message: TextEditingController(),
        numStatus: 0.0),
    InteractiveModel(
        name: "Warning and Instrument Cluster",
        message: TextEditingController(),
        numStatus: 0.0),
    InteractiveModel(
        name: "AC Operation",
        message: TextEditingController(),
        numStatus: 0.0),
  ];

  void changeColurs(double value){
    if (value.toInt() > 0){
      selColor = Colors.green;
    }else if (value.toInt() < 0){
      selColor = Colors.red;
    }else if (value.toInt() == 0){
      selColor = Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: items2.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Container(
                width: 90,
                height: 50,
                padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    // activeTrackColor: Colors.blue,
                    // inactiveTrackColor: Colors.blue,
                    trackShape: const RectangularSliderTrackShape(),
                    trackHeight: 4.0,
                    // thumbColor: Colors.blueAccent,
                    thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 12.0),
                    // overlayColor: Colors.red.withAlpha(32),
                    overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 20.0),
                  ),
                  child: StatefulBuilder(
                    builder:
                        (BuildContext context, StateSetter setState) {
                      return Slider(
                        value: items2[index].numStatus,
                        min: -1,
                        max: 1,
                        divisions: 2,
                        activeColor: selColor,
                        inactiveColor: selColor,
                        onChanged: (double value) {
                          setState(() {
                            items2[index].numStatus = value;
                            changeColurs(value);
                          });
                        },
                        // onChangeEnd: (double value) {
                        //   setState(() {
                        //     items2[index].numStatus = value;
                        //     changeColurs(value);
                        //   });
                        // },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: Text(
                  items2[index].name,
                  style: const TextStyle(color: Colors.white,fontSize: 18),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: items2[index].message,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Remarks",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Text("Remarks",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                  controller: finalRemarks,
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
                  final List<InteractiveModel> formData = [];

                  for (InteractiveModel indx in items2) {
                    final remarks = indx.message;
                    final name = indx.name;
                    final status = indx.numStatus;

                    final InteractiveModel singleModel =
                    InteractiveModel(
                        name: name,
                        message: remarks,
                        numStatus: status);
                    formData.add(singleModel);
                  }
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white,fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
