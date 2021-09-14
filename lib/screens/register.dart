import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homey/core/components.dart';
import 'package:homey/screens/emailverification.dart';
import 'package:homey/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homey/core/styles.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  String status = '';
  bool invalidEmail = false;
  register() async {
    try {
      var response = await http.post(
          Uri.parse('http://webcodez.pythonanywhere.com/accounts/register/'),
          body: {
            'name': nameController.text.toString(),
            'email': emailController.text.toString(),
            'username': usernameController.text.toString(),
            'password': passwordController.toString(),
            'mobile': mobileController.text.toString()
          });
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        setState(() {
          status = jsonData['status'];
        });
      } else if (response.statusCode == 400) {
        setState(() {
          invalidEmail = true;
        });
      }
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
                    //SizedBox(height: size.height*0.01,),
                    Container(
                      child: Text("START BUYING",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
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
                  child: Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Registration",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                          child: Text(
                            "Fill in the account details",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Color(0XFFDBDBDC),
                                      child: Icon(
                                        Icons.account_circle_outlined,
                                        color: Color(0xFF445A7A),
                                        size: 50,
                                      )),
                                  Positioned(
                                    bottom: 4,
                                    right: 0,
                                    //right: 1,
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: CircleAvatar(
                                          radius: 12,
                                          backgroundColor: Color(0XFFC4C4C4),
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                            color: Color(0xFF445A7A),
                                            size: 15,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                            Container(
                              width: size.width * 0.6,
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
                                padding: EdgeInsets.only(left: 16.0),
                                child: TextFormField(
                                  controller: nameController,
                                  validator: (value) {
                                    if (value.toString().isEmpty)
                                      return 'Please enter your name';
                                    return null;
                                  },
                                  cursorColor: Colors.black,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Name',
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
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
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
                          child: ListTile(
                            leading: Padding(
                              padding:
                                  EdgeInsets.only(top: size.height * 0.008),
                              child: Icon(
                                Icons.alternate_email,
                                color: Colors.black,
                              ),
                            ),
                            title: TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value.toString().isEmpty)
                                  return 'Please enter your email';
                                return null;
                              },
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Email',
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
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Container(
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
                          child: ListTile(
                            leading: Padding(
                              padding:
                                  EdgeInsets.only(top: size.height * 0.008),
                              child: Icon(
                                Icons.account_box_outlined,
                                color: Colors.black,
                              ),
                            ),
                            title: TextFormField(
                              controller: usernameController,
                              validator: (value) {
                                if (value.toString().isEmpty)
                                  return 'Please enter username';
                                return null;
                              },
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Username',
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
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Container(
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
                          child: ListTile(
                            leading: Padding(
                              padding:
                                  EdgeInsets.only(top: size.height * 0.008),
                              child: Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.black,
                              ),
                            ),
                            title: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              validator: (value) {
                                if (value.toString().isEmpty)
                                  return 'Please enter password';
                                return null;
                              },
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Password',
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
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Container(
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
                          child: ListTile(
                            leading: Padding(
                              padding:
                                  EdgeInsets.only(top: size.height * 0.008),
                              child: Icon(
                                Icons.phone_in_talk_outlined,
                                color: Colors.black,
                              ),
                            ),
                            title: TextFormField(
                              maxLength: 10,
                              controller: mobileController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.toString().isEmpty)
                                  return 'Please enter your contact number';
                                return null;
                              },
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                counterText: "",
                                labelText: 'Phone number',
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
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.yellow,
                            ),
                            Container(
                              child: Text(
                                "I agree to the Homey's Terms and Conditions & Privacy Policy",
                                style: TextStyle(
                                    color: Color(0XFF7F7F80), fontSize: 10),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.03,
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
                                if (_key.currentState!.validate()) {
                                  await register();
                                  if (invalidEmail) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text('Invalid Email')));
                                  } else {
                                    if (status == '200') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EmailVerification(
                                                    email: emailController.text,
                                                  )));
                                    } else if (status == '400') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text('User already exists')));
                                    }
                                  }
                                }
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
