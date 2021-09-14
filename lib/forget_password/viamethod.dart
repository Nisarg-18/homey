import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homey/core/components.dart';
import 'package:homey/forget_password/FemailVerification.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homey/core/styles.dart';
import 'package:http/http.dart' as http;

class ViaMethod extends StatefulWidget {
  const ViaMethod({Key? key}) : super(key: key);

  @override
  _ViaMethodState createState() => _ViaMethodState();
}

class _ViaMethodState extends State<ViaMethod> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  String apiStatus = '';
  bool invalidEmail = false;
  forgotPassword() async {
    try {
      var response = await http.post(
          Uri.parse(
              'http://webcodez.pythonanywhere.com/accounts/forgot-password/'),
          body: {
            'email': emailController.text,
          });
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        setState(() {
          apiStatus = jsonData['status'];
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

  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _key,
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
                                  child: Center(
                                      child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ))),
                            ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        child: Text(
                          "Enter your email address to reset your \npassword",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
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
                            padding: EdgeInsets.only(top: size.height * 0.008),
                            child: Icon(
                              Icons.alternate_email,
                              color: Colors.black,
                            ),
                          ),
                          title: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value.toString().isEmpty)
                                return 'Enter your email';
                              return null;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Via email:',
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
                        height: size.height * 0.05,
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
                                await forgotPassword();
                                if (invalidEmail) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Invalid Email')));
                                } else {
                                  if (apiStatus == '200') {
                                    showDialogFunc(
                                        context, emailController.text);
                                  }
                                }
                              }
                            },
                            child: const Text(
                              'Send Link',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.4,
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
            ],
          ),
        ),
      ),
    );
  }
}

showDialogFunc(context, email) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.9,
              // height: MediaQuery.of(context).size.height * 0.3,
              child: Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "Don't panic A Reset Email link has been \n\nsent to your email. Do check your spam \n\nfolder too.",
                        style: TextStyle(
                          fontSize: 14,
                          color: bgSupportPink,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Center(
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:
                                  bgSupportPink, //background color of button
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FemailVerification(email: email)));
                            },
                            child: const Text(
                              'Continue',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
