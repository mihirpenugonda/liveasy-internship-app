import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'mobile_entry.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liveasy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 135),
            child: Column(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset('assets/box.svg'),
                    Positioned(
                      top: 9.33,
                      left: 9.33,
                      child: SvgPicture.asset('assets/box-circle.svg'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SvgPicture.asset('assets/box-line.svg'),
                    ),
                  ],
                ),
                Container(
                  height: 42.0,
                ),
                const Text(
                  "Please select your language",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
                Container(
                  height: 11.23,
                ),
                const Text(
                  "You can change the language",
                  style: TextStyle(
                    color: Color(0xAA6A6C7B),
                    fontSize: 18,
                  ),
                ),
                const Text(
                  "at any time.",
                  style: TextStyle(
                    color: Color(0xAA6A6C7B),
                    fontSize: 18,
                  ),
                ),
                Container(
                  height: 24.51,
                ),
                Container(
                  width: 215,
                  height: 47,
                  padding: const EdgeInsets.only(
                    left: 9.32,
                    right: 9.32,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: const Color.fromRGBO(47, 48, 55, 100),
                    width: 1,
                  )),
                  child: DropdownButton<String>(
                    alignment: AlignmentDirectional.center,
                    value: dropdownValue,
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(
                      color: Color.fromRGBO(47, 48, 55, 100),
                      fontSize: 18,
                    ),
                    underline: const SizedBox(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['English', 'Hindi', 'Telugu', 'Tamil']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  height: 24.5,
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MobileEntry()))
                  },
                  child: Container(
                    height: 47,
                    width: 216,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(46, 59, 98, 1)),
                    alignment: AlignmentDirectional.center,
                    child: const Text(
                      "NEXT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              SvgPicture.asset('assets/blue-wave.svg'),
              Positioned(
                bottom: 0,
                child: SvgPicture.asset('assets/black-wave.svg'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
