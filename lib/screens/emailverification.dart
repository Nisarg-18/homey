import 'dart:convert';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:homey/core/components.dart';
import 'package:homey/screens/mobileverification.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homey/core/styles.dart';
import 'package:homey/screens/signupsuccess.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;

class EmailVerification extends StatefulWidget {
  final email;
  const EmailVerification({Key? key, required this.email}) : super(key: key);

  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  String otpVal = '';
  String otpStatus = '';
  int count = 0;
  checkOtp() async {
    try {
      var response = await http.post(
          Uri.parse('http://webcodez.pythonanywhere.com/accounts/confirm/'),
          body: {
            'email': widget.email,
            'otp': otpVal,
          });
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      setState(() {
        otpStatus = jsonData['status'];
      });
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                  top: size.height * .03,
                  left: size.width * .04,
                  right: size.width * .04),
              height: size.height * .30,
              decoration: BoxDecoration(
                color: bgSupportPink,
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: size.height * .025),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0XFFF45E8B),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                ),
                                padding: EdgeInsets.only(left: 8),
                                child: Center(
                                    child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ))),
                          ),
                          Container(
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                color: Color(0XFF296EB4),
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * .20 - 14),
              child: Container(
                padding: EdgeInsets.only(
                    top: size.height * .03,
                    left: size.width * .1,
                    right: size.width * .1),
                height: size.height * .80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Enter  4-digit \nVerification code",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        child: Text(
                          "Code send to ${widget.email}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          child: ArgonTimerButton(
                            splashColor: Colors.transparent,
                            height: MediaQuery.of(context).size.height * 0.065,
                            width: 0,
                            highlightColor: Colors.transparent,
                            highlightElevation: 0,
                            roundLoadingShape: false,
                            onTap: (startTimer, btnState) {
                              if (btnState == ButtonState.Idle) {
                                startTimer(59);
                              }
                            },
                            initialTimer: 59,
                            child: GestureDetector(
                                child: Text(
                                  "Resend New Code",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                onTap: () {}),
                            loader: (timeLeft) {
                              return Text(
                                "This code will expire in 00:$timeLeft",
                                style: TextStyle(fontSize: 16),
                              );
                            },
                            borderRadius: 100.0,
                            color: Colors.transparent,
                            elevation: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: OTPTextField(
                          onChanged: (pin) {
                            setState(() {
                              otpVal = pin;
                            });
                          },
                          onCompleted: (otp) {
                            setState(() {
                              otpVal = otp.toString();
                            });
                          },
                          keyboardType: TextInputType.number,
                          length: 4,
                          width: MediaQuery.of(context).size.width,
                          fieldWidth: MediaQuery.of(context).size.width * 0.15,
                          otpFieldStyle: OtpFieldStyle(
                            backgroundColor: Colors.transparent,
                            enabledBorderColor: Colors.black,
                            errorBorderColor: Colors.red,
                            focusBorderColor: Colors.black,
                          ),
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.transparent,
                                    offset: Offset(0, -20))
                              ],
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black,
                              decorationThickness: 1.0),
                          textFieldAlignment: MainAxisAlignment.spaceEvenly,
                          fieldStyle: FieldStyle.box,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.35,
                      ),
                      Center(
                        child: SizedBox(
                          height: 50,
                          width: 140,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:
                                  bgSupportPink, //background color of button
                              //side: BorderSide(width:3, color:Colors.brown), //border width and color
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () async {
                              if (otpVal.length != 4) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Please Enter a Valid OTP'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('OK'))
                                        ],
                                      );
                                    });
                              } else if (otpVal.length == 4) {
                                await checkOtp();
                                if (otpStatus == '200') {
                                  Navigator.popUntil(context, (route) {
                                    return count++ == 3;
                                  });
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SignupSuccess();
                                  }));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                              'Invalid OTP, Please try again'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('OK'))
                                          ],
                                        );
                                      });
                                }
                              }
                            },
                            child: const Text(
                              'Continue',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Center(
                        child: Container(
                          width: size.width * 0.35,
                          child: Divider(
                            color: Colors.black,
                            thickness: 4,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
