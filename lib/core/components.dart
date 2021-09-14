import 'package:flutter/material.dart';

const MaterialColor kPrimaryColor = MaterialColor(
  _primaryValue,
  <int, Color>{
    0: const Color(_primaryValue),
    100: const Color(0xFF0079C2),
    80: const Color(0xCC0079C2),
    60: const Color(0x990079C2),
    40: const Color(0x660079C2),
    20: const Color(0x330079C2),
    10: const Color(0x1A0079C2),
    5: const Color(0x0D0079C2),
  },
);
const int _primaryValue = 0xFF002033;

const MaterialColor kAccentColor = MaterialColor(
  _accentValue,
  <int, Color>{
    0: const Color(_accentValue),
    100: const Color(0xFF820025),
    80: const Color(0xCC820025),
    60: const Color(0x99820025),
    40: const Color(0x66820025),
    20: const Color(0x33820025),
    10: const Color(0x1A820025),
    5: const Color(0x0D820025),
  },
);

const int _accentValue = 0xFF33000F;

const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

// Supporting colors
const kSupportRed = Color(0xFFC20000);
const kSupportBlue = Color(0xFF18A0FB);
const kLightBlue = Color(0xFF99C9E7);
const kSupportGreen = Color(0xFF00C21F);
const kSupportAccent = Color(0xFFF44336);
const kBlackVariant = Color(0xFF002033);
const kDarkGrey = Color(0xFF4D6370);
const kGrey = Color(0xFFBDBDBD);
const kBackgroundColor = Color(0xFFF3F3F3);

const bgSupportPink = Color.fromRGBO(243, 76, 126, 1);
const kSupportYellow = Color.fromRGBO(253, 224, 33, 1);
const kSupportGrey = Color.fromRGBO(196, 196, 196, 0.6);
