import 'dart:math';
import 'dart:ui' as ui;
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
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Container(
            // color: Colors.red,
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.only(top: 30, bottom: 30, left: 70, right: 70),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 50),
                        notchCardView(isNotchUp: false),
                        const Spacer(),
                        notchCardView(isNotchUp: false),
                        const SizedBox(width: 50),
                      ],
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width - 250,
                      // height: MediaQuery.of(context).size.height / 3 -132,
                      color: Colors.red,
                      child: Image.network("https://i.ibb.co/wC0tfsR/name.png"),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 50),
                        notchCardView(isNotchUp: true),
                        const Spacer(),
                        notchCardView(isNotchUp: true),
                        const SizedBox(width: 50),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text("Battery",
                        style: TextStyle(color: Colors.white)),
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
                    const Text("Select Condition",
                        style: TextStyle(color: Colors.white)),
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
                  children: const [
                    Text("dsfghfjkgfdsa"),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
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
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Column notchCardView({bool? isNotchUp}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: isNotchUp == true
          ? <Widget>[
              Transform.rotate(
                angle: pi,
                child: ClipPath(
                  clipper: TriangleClipper(),
                  child: Container(
                    color: Colors.black,
                    height: 15,
                    width: 25,
                  ),
                ),
              ),
              Container(
                width: 250,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: const Center(child: Text("sdbcnjksd")),
              ),
            ]
          : <Widget>[
              Container(
                width: 250,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: const Center(child: Text("sdbcnjksd")),
              ),
              ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  color: Colors.black,
                  height: 15,
                  width: 25,
                ),
              ),
            ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
