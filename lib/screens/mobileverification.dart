import 'package:flutter/material.dart';
import 'package:homey/core/components.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homey/core/styles.dart';

class MobileVerification extends StatefulWidget {
  const MobileVerification({Key? key}) : super(key: key);

  @override
  _MobileVerificationState createState() => _MobileVerificationState();
}

class _MobileVerificationState extends State<MobileVerification> {
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
                child: Expanded(
                  //flex: 1,
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
                    )),
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
                        "Code send to +92345**** This code will \nexpired in 01:30",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Container(
                      height: size.height*0.07,
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
                        padding: EdgeInsets.only(left: size.width*0.05, right: size.width*0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text("1"),
                            ),
                            Container(
                              child: Text("9"),
                            ),
                            Container(
                              child: Text("2"),
                            ),
                            Container(
                              child: Text("3"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.4,
                    ),
                    Center(
                      child: SizedBox(
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MobileVerification()));
                          },
                          child: const Text(
                            'Continue',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.04,),
                    Center(
                      child: Container(
                        width: size.width*0.35,
                        child: Divider(color: Colors.black, thickness: 4,),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
