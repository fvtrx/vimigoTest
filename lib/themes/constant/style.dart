import 'package:flutter/material.dart';

final loginLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final loginBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFFFFFFF),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final loginHintStyle = TextStyle(
  color: Colors.black54,
  fontFamily: 'OpenSans',
);

final rememberCheckBox = TextStyle(color: Colors.white, fontFamily: 'OpenSans');
