import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/core/components.dart';

class PrimaryTextField extends StatelessWidget {
  final String text;
  final int minLines;
  final int maxLines;
  final int maxLength;
  final Color focusedColor;
  final Color enabledColor;
  final Color errorColor;
  final Color fillColor;
  final Function(String) onchanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final Widget icon;
  final bool obscureText;
  final Widget suffix;

  PrimaryTextField(
      {this.text = 'test',
      this.minLines = 1,
      this.maxLines = 1,
      this.maxLength = 10,
      this.focusedColor = kDarkGrey,
      this.enabledColor = kGrey,
      this.errorColor = kSupportAccent,
      required this.fillColor,
      required this.onchanged,
      required this.inputFormatters,
      required this.keyboardType,
      required this.validator,
      this.obscureText = false,
      required this.suffix,
      required this.icon,
      required this.controller})
      : super();
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        cursorColor: Colors.grey,
        maxLength: maxLength,
        controller: controller,
        onChanged: onchanged,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          suffixIcon: suffix,
          labelText: text,
          icon: icon,
          filled: fillColor != null,
          fillColor: fillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1.5, color: focusedColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1.5, color: enabledColor),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1.5, color: errorColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1.5, color: errorColor)),
        ),
        validator: validator,
      ),
    );
  }
}
