import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homey/core/components.dart';
import 'package:homey/screens/register.dart';
import 'package:homey/forget_password/viamethod.dart';
import 'package:homey/core/styles.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   // is not restarted.
      //   primarySwatch: Colors.blue,
      // ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String loginStatus = '';
  bool invalidEmail = false;
  login() async {
    try {
      var response = await http.post(
          Uri.parse('http://webcodez.pythonanywhere.com/accounts/login/'),
          body: {
            'email': emailController.text,
            'password': passwordController.text,
          });
      if (response.statusCode == 400) {
        setState(() {
          invalidEmail = true;
        });
      } else if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        setState(() {
          loginStatus = jsonData['status'];
        });
        print(loginStatus);
      }
    } catch (e) {
      print('error:$e');
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
                          Container(
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
                          Container(
                            child: Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
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
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "HOMEY",
                          style: TextStyle(
                              fontFamily: 'FredokaOne-Regular',
                              fontSize: 38,
                              color: kSupportYellow,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * .26 - 12),
              child: Container(
                  padding: EdgeInsets.only(
                    top: size.height * .03,
                  ), //left: size.width * .1, right: size.width * .1),
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
                    children: [
                      Container(
                        child: Text(
                          "Welcome Back",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * .1, right: size.width * .1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
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
                                onPressed: () {},
                                child: const Text(
                                  'BUYER',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 140,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      Colors.white, //background color of button
                                  side: BorderSide(
                                      width: 1,
                                      color:
                                          kSupportYellow), //border width and color
                                  elevation: 3, //elevation of button
                                  shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'SELLER',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.07,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * .1, right: size.width * .1),
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
                          child: ListTile(
                            leading: Padding(
                              padding:
                                  EdgeInsets.only(top: size.height * 0.008),
                              child: Icon(
                                Icons.email,
                                color: bgSupportPink,
                              ),
                            ),
                            title: TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value.toString().isEmpty)
                                  return 'Please enter your email-id';
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
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * .1, right: size.width * .1),
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
                          child: ListTile(
                            leading: Padding(
                              padding:
                                  EdgeInsets.only(top: size.height * 0.008),
                              child: Icon(
                                Icons.lock,
                                color: bgSupportPink,
                              ),
                            ),
                            title: TextFormField(
                              controller: passwordController,
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
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      SizedBox(
                        height: 50,
                        width: 140,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: bgSupportPink, //background color of button
                            //side: BorderSide(width:3, color:Colors.brown), //border width and color
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () async {
                            await login();
                            if (invalidEmail) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Invalid Email')));
                            } else {
                              if (loginStatus == '200') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Login Success')));
                              } else if (loginStatus == '400') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('User Invalid')));
                              }
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViaMethod()));
                        },
                        child: Container(
                          child: Text(
                            "Forgot Your Password?",
                            style: TextStyle(
                              color: bgSupportPink,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(right: 15.0),
                              child: Divider(
                                color: Colors.black,
                                height: 50,
                              )),
                        ),
                        Text(
                          "Or Sign Up Now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(left: 15.0),
                              child: Divider(
                                color: Colors.black,
                                height: 50,
                              )),
                        ),
                      ]),
                      SizedBox(
                        height: 40,
                        width: 180,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white, //background color of button
                            //side: BorderSide(width:3, color:Colors.brown), //border width and color
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: const Text(
                            'Create Account',
                            style: TextStyle(
                              color: bgSupportPink,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
