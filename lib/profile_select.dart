import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSelect extends StatefulWidget {
  const ProfileSelect({Key? key}) : super(key: key);

  @override
  _ProfileSelectState createState() => _ProfileSelectState();
}

class _ProfileSelectState extends State<ProfileSelect> {
  int _selectedProfile = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 112),
              child: Text(
                "Please select your profile",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 26),
            GestureDetector(
              onTap: () => {
                setState(() {
                  _selectedProfile = 1;
                }),
              },
              child: Container(
                height: 89,
                width: 328,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: _selectedProfile == 1
                            ? Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                      style: BorderStyle.solid,
                                    ),
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SvgPicture.asset('assets/shipper.svg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(bottom: 6.0),
                              child: Text(
                                "Shipper",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, \nconsectetur adipiscing",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => {
                setState(() {
                  _selectedProfile = 2;
                }),
              },
              child: Container(
                height: 89,
                width: 328,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: _selectedProfile == 2
                            ? Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                      style: BorderStyle.solid,
                                    ),
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SvgPicture.asset('assets/transporter.svg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(bottom: 6.0),
                              child: Text(
                                "Transporter",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, \nconsectetur adipiscing",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => {},
              child: Container(
                height: 56,
                width: 328,
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(46, 59, 98, 1)),
                alignment: AlignmentDirectional.center,
                child: const Text(
                  "CONTINUE",
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
    );
  }
}
