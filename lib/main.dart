import 'package:flutter/material.dart';
import 'package:profile_app/Screen1.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'Models.dart';
import 'Screen2.dart';
import 'Screen3.dart';
import 'Screen4.dart';
import 'SubScreen2.dart';
import 'subScreen1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
      )),
      home: DragAndDropScreen(),
    );
  }
}

class DragAndDropScreen extends StatefulWidget {
  const DragAndDropScreen({Key? key}) : super(key: key);

  @override
  State<DragAndDropScreen> createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _tabs = [
    "Outside Inventory",
    "Helth Card",
    "Inside Inventory",
    "Interactive CheckSheet",
    "Customer Conserns",
    "Service Product",
    "Service Estimate",
    "Accessories",
    "Photo",
    "Mobile Xentry Portal"
  ];

  TabController? _tabController;
  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("DEMO"),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            child: TabBar(
              controller: _tabController,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 4,
                  color: Color(0xFF646464),
                ),
                insets: EdgeInsets.only(left: 0, right: 8, bottom: 4),
              ),
              isScrollable: true,
              labelPadding: const EdgeInsets.only(left: 10, right: 10),
              tabs: _tabs
                  .map(
                    (label) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Tab(text: label),
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              const Text("Outside Inventory",
                  style: TextStyle(color: Colors.white)),
              Screen4(),
              //TODO: INSIDE INVENTORY
              Screen1(),
              //TODO: INTERACTIVE CHECKSHEET
              Screen2(),
              ButtonClass(),
              CarsScreen(),
              const Text("dfsghjkl;", style: TextStyle(color: Colors.white)),
              const Text("dfsghjkl;", style: TextStyle(color: Colors.white)),
              Screen3(),
              const Text("dfsghjkl;", style: TextStyle(color: Colors.white))
            ]),
          ),
        ],
      ),
    );
  }
}


