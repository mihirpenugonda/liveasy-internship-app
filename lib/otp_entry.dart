import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liveasy/profile_select.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPEntry extends StatefulWidget {
  String number = "";
  String countryCode = "";

  OTPEntry({Key? key, required this.number, required this.countryCode})
      : super(key: key);

  @override
  _OTPEntryState createState() => _OTPEntryState();
}

class _OTPEntryState extends State<OTPEntry> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 21, top: 21),
                    child: Icon(
                      Icons.arrow_back,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 53.59,
                ),
                const Text(
                  "Verify Phone",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
                Container(
                  height: 11.23,
                ),
                Text(
                  "Code sent to " + widget.number,
                  style: const TextStyle(
                    color: Color(0xFF6A6C7B),
                    fontSize: 18,
                  ),
                ),
                Container(
                  height: 24,
                ),
                Container(
                  width: 350,
                  child: PinCodeTextField(
                    keyboardType: TextInputType.number,
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderWidth: 0,
                      errorBorderColor: Colors.white,
                      fieldHeight: 48,
                      fieldWidth: 48,
                      borderRadius: BorderRadius.zero,
                      selectedFillColor: const Color(0xFF93D2F3),
                      inactiveFillColor: const Color(0xFF93D2F3),
                      activeFillColor: const Color(0xFF93D2F3),
                    ),
                    // animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {
                      print(v);
                    },
                    onChanged: (v) => {},
                  ),
                ),
                const Text(
                  "Didn’t receive the code? Request Again",
                  style: TextStyle(
                    color: Color(0xFF6A6C7B),
                    fontSize: 14,
                  ),
                ),
                Container(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileSelect()))
                  },
                  child: Container(
                    height: 56,
                    width: 328,
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
            )
          ],
        ),
      ),
    );
  }
}
