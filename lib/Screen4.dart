import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {

  final TextEditingController txt1 = TextEditingController();
  final TextEditingController txt2 = TextEditingController();
  final TextEditingController txt3 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 30, bottom: 30, left: 70, right: 70),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("dsfgh", style: TextStyle(color: Colors.white)),
                          Text("dsfgh", style: TextStyle(color: Colors.white)),
                          Text("dsfgh", style: TextStyle(color: Colors.white))
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text("dsfgh", style: TextStyle(color: Colors.white)),
                          Text("dsfgh", style: TextStyle(color: Colors.white)),
                          Text("dsfgh", style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    color: Colors.transparent,
                    child: Image.network("https://i.ibb.co/wC0tfsR/name.png"),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("dsfgh", style: TextStyle(color: Colors.white)),
                          Text("dsfgh", style: TextStyle(color: Colors.white)),
                          Text("dsfgh", style: TextStyle(color: Colors.white))
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text("dsfgh", style: TextStyle(color: Colors.white)),
                          Text("dsfgh", style: TextStyle(color: Colors.white)),
                          Text("dsfgh", style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text("Battery", style: TextStyle(color: Colors.white)),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: txt2,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Voltage volts",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text("Select Condition", style: TextStyle(color: Colors.white)),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: txt1,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Voltage volts",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Text("dsfghfjkgfdsa"),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
