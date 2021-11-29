import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/profile_select.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

enum MobileVerfificationState { SHOW_MOBILE_FORM, SHOW_OTP_FORM }

class MobileEntry extends StatefulWidget {
  const MobileEntry({Key? key}) : super(key: key);

  @override
  State<MobileEntry> createState() => _MobileEntryState();
}

class _MobileEntryState extends State<MobileEntry> {
  MobileVerfificationState currentState =
      MobileVerfificationState.SHOW_MOBILE_FORM;

  String verificationId = "";
  String otp = "";

  String selected = "+91";
  String number = "";

  void print(CountryCode countryCode) {
    setState(() {
      selected = countryCode.toString();
    });
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });

      if (authCredential?.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileSelect()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      _scaffoldKey.currentState!
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  getMobileFormState(context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => {Navigator.pop(context)},
              child: const Padding(
                padding: EdgeInsets.only(top: 21, left: 21),
                child: Icon(
                  Icons.close,
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
              "Please enter your mobile number",
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
              "You'll receive a 4 digit code",
              style: TextStyle(
                color: Color(0xFF6A6C7B),
                fontSize: 18,
              ),
            ),
            const Text(
              "to verify next",
              style: TextStyle(
                color: Color(0xFF6A6C7B),
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Container(
                width: 327,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black, width: 1, style: BorderStyle.solid),
                ),
                child: Row(
                  children: [
                    CountryCodePicker(
                      onChanged: print,
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'IN',
                      favorite: const ['+91', 'FR'],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Mobile Number",
                          hintStyle: TextStyle(
                            color: Color(0xFF6A6C7B),
                            fontWeight: FontWeight.w600,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: (content) {
                          number = content;
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () async {
                setState(() {
                  showLoading = true;
                });
                _auth.verifyPhoneNumber(
                    phoneNumber: selected + number,
                    verificationCompleted: (phoneAuthCredential) async {
                      setState(() {
                        showLoading = false;
                      });
                      // signInWithPhoneAuthCredential(phoneAuthCredential);
                    },
                    verificationFailed: (verificationFailed) async {
                      setState(() {
                        showLoading = false;
                      });
                      _scaffoldKey.currentState!.showSnackBar(SnackBar(
                          content:
                              Text(verificationFailed.message.toString())));
                    },
                    codeSent: (verificationId, resendingToken) async {
                      setState(() {
                        showLoading = false;
                        currentState = MobileVerfificationState.SHOW_OTP_FORM;
                        this.verificationId = verificationId;
                      });
                    },
                    codeAutoRetrievalTimeout: (verificationId) async {});
              },
              child: Container(
                height: 56,
                width: 328,
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(46, 59, 98, 1)),
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
    );
  }

  getOtpFormState(context) {
    return Column(
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
              "Code sent to " + number,
              style: const TextStyle(
                color: Color(0xFF6A6C7B),
                fontSize: 18,
              ),
            ),
            Container(
              height: 24,
            ),
            SizedBox(
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
                  otp = v;
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
              onTap: () async {
                log(otp);
                PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: verificationId, smsCode: otp);
                signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              child: Container(
                height: 56,
                width: 328,
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(46, 59, 98, 1)),
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
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: showLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : currentState == MobileVerfificationState.SHOW_MOBILE_FORM
                ? getMobileFormState(context)
                : getOtpFormState(context),
      ),
    );
  }
}
