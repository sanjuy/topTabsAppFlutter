import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ButtonClass extends StatefulWidget {
  const ButtonClass({Key? key}) : super(key: key);

  @override
  State<ButtonClass> createState() => _ButtonClassState();
}

class _ButtonClassState extends State<ButtonClass> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: TextButton(
            onPressed: () {
              setState(() {
                flag = !flag;
              });
            },
            child: const Text("Open Profile Screen")),
      ),
      (flag) ? SubScreen1() : Container(),
    ]);
  }
}

class SubScreen1 extends StatefulWidget {
  const SubScreen1({Key? key}) : super(key: key);

  @override
  State<SubScreen1> createState() => _SubScreen1State();
}

class _SubScreen1State extends State<SubScreen1> {
  ProfileModel singleProfile = ProfileModel(
      Name: "Abhishek Biswas",
      Mobile: "+91876543210",
      CallerName: "Ghost Raily 772",
      Address: "MMM Hall IIT KGP",
      Email: "abhishek.biswas875@gmail.com",
      CarsModel: "Mercedics Benz C200",
      RegistrationNumber: "22100018",
      VinNo: "W1k2000KGP",
      PurchaseDate: "19/05/2023",
      Milage: "105 KM",
      Drop: "IDK",
      EstimatedDateOfCompletion: "19/05/2023",
      TakeImage: "SOME");

  Widget getData(String titleName, String ModelDataValue) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleName,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 5),
          Text(ModelDataValue,
              style: const TextStyle(color: Colors.blue, fontSize: 16))
        ],
      ),
    );
  }

  Widget getVinData(String titleName, String ModelDataValue) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleName,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(ModelDataValue,
                  style: const TextStyle(color: Colors.blue, fontSize: 16)),
              TextButton(onPressed: (){}, child: const Icon(Icons.copy))
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget getMilage(String titleName) {
    final TextEditingController finalRemarks1 = TextEditingController();

    return Container(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleName,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
          Container(
            width: 300,
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
        ],
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Widget getCompleationDate(String titleName) {
    final TextEditingController finalRemarks1 = TextEditingController();

    return Container(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleName,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(width: 5),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.deepPurpleAccent, width: 2),
              ),
            ),
            width: 50,
            child: TextButton(onPressed: (){
              _selectDate(context);
            }, child: const Icon(Icons.calendar_month)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // width: double.infinity,
        // padding: const EdgeInsets.only(right: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getData("Name", singleProfile.Name),
            const SizedBox(height: 15),
            getData("Mobile", singleProfile.Mobile),
            const SizedBox(height: 15),
            getData("Caller Name", singleProfile.CallerName),
            const SizedBox(height: 15),
            getData("Address", singleProfile.Address),
            const SizedBox(height: 15),
            getData("Email", singleProfile.Email),
            const SizedBox(height: 15),
            getData("Cars Models", singleProfile.CarsModel),
            const SizedBox(height: 15),
            getData("Registration", singleProfile.RegistrationNumber),
            const SizedBox(height: 15),
            getData("Vin No", singleProfile.VinNo),
            const SizedBox(height: 15),
            getData("Purchase Date", singleProfile.PurchaseDate),
            const SizedBox(height: 15),
            getMilage("Mileage"),
            const SizedBox(height: 15),
            DroppingDown(title: "Drop"),
            const SizedBox(height: 15),
            getCompleationDate("Estimated Completion Date"),
            const SizedBox(height: 15),
            CameraWithBt(titleName: "Take Photo"),
          ],
        ),
      ),
    );
  }
}

class DroppingDown extends StatefulWidget {
  DroppingDown({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<DroppingDown> createState() => _DroppingDownState();
}

class _DroppingDownState extends State<DroppingDown> {
  List<String> dropList = <String>['YES', 'NO'];
  late String dropDownValue;

  @override
  void initState() {
    super.initState();
    dropDownValue = dropList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 3),
          Container(
            width: 300, // Set the width of the dropdown menu
            child: DropdownButton<String>(
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
            ),
          ),
        ],
      ),
    );
  }
}



class CameraWithBt extends StatefulWidget {
  const CameraWithBt({Key? key, required this.titleName}) : super(key: key);
  final titleName;
  @override
  State<CameraWithBt> createState() => _CameraWithBtState();
}

class _CameraWithBtState extends State<CameraWithBt> {
  List<XFile> capturedImages = [];
  Future<void> _takePicture() async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          capturedImages.add(image);
        });
      }
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.titleName, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 5),
          TextButton(
              onPressed: () {
                setState(() {
                  _takePicture;
                });
              },
              child: const Icon(Icons.camera_alt_outlined))
        ],
      ),
    );
  }
}

class ProfileModel {
  String Name;
  String Mobile;
  String CallerName;
  String Address;
  String Email;
  String CarsModel;
  String RegistrationNumber;
  String VinNo;
  String PurchaseDate;
  String Milage;
  String Drop;
  String EstimatedDateOfCompletion;
  String TakeImage;

  ProfileModel(
      {required this.Name,
      required this.Mobile,
      required this.CallerName,
      required this.Address,
      required this.Email,
      required this.CarsModel,
      required this.RegistrationNumber,
      required this.VinNo,
      required this.PurchaseDate,
      required this.Milage,
      required this.Drop,
      required this.EstimatedDateOfCompletion,
      required this.TakeImage});
}
