import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  void Function()? onTap;
  final double width;
  final double height;
  final double fontSize;
  final Color color;

  PrimaryButton(
      {required this.text,
      required this.onTap,
      required this.width,
      required this.height,
      required this.fontSize,
      this.color = Colors.white})
      : super();

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<PrimaryButton> {
  Color? currentColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),
              ],
              borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
              child: Text(widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: widget.fontSize,
                    shadows: <Shadow>[
                      Shadow(
                          offset: Offset(1.5, 1.5),
                          blurRadius: 2.0,
                          color: Colors.black12),
                    ],
                    color: widget.color,
                  ))),
        ),
        onTap: widget.onTap);
  }
}
