import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homey/core/components.dart';
import 'package:homey/forget_password/viamethod.dart';
import 'package:homey/forget_password/passwordchanged.dart';
import 'package:homey/screens/mobileverification.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homey/core/styles.dart';
import 'package:http/http.dart' as http;

class ChangePassword extends StatefulWidget {
  final token, email;
  const ChangePassword({Key? key, required this.token, required this.email})
      : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reNewPasswordController = TextEditingController();
  int count = 0;
  newPassword() async {
    try {
      var response = await http.post(
          Uri.parse(
              'http://webcodez.pythonanywhere.com/accounts/new-password/'),
          body: {
            'email': widget.email,
            'key': widget.token,
            'newpassword': reNewPasswordController.text
          });
      var jsonData = jsonDecode(response.body);
      print(jsonData);
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
                top: size.height * .06,
                left: size.width * .04,
                right: size.width * .04),
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
                        color: Color(0XFFFEEDF2),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ))),
                ),
                GestureDetector(
                  onTap: () async {
                    if (newPasswordController.text ==
                        reNewPasswordController.text) {
                      await newPassword();
                      Navigator.popUntil(context, (route) {
                        return count++ == 5;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PasswordChanged()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Both Passwords do not match')));
                    }
                  },
                  child: Container(
                      width: 50,
                      height: 50,
                      child: Center(
                          child: Icon(
                        Icons.check,
                        color: Colors.black,
                      ))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * .03,
                left: size.width * .1,
                right: size.width * .1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 33,
                    color: Color(0xFFD3D3D3).withOpacity(.84),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: TextFormField(
                  obscureText: true,
                  controller: newPasswordController,
                  validator: (value) {
                    if (value.toString().isEmpty) return 'Enter a new Password';
                    return null;
                  },
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * .03,
                left: size.width * .1,
                right: size.width * .1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 33,
                    color: Color(0xFFD3D3D3).withOpacity(.84),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: TextFormField(
                  obscureText: true,
                  controller: reNewPasswordController,
                  validator: (value) {
                    if (value.toString().isEmpty) return 'Enter Password';
                    return null;
                  },
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Re-enter new password',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
        ],
      ),
    ));
  }
}
