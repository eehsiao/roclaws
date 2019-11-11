import 'dart:convert';

import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';


enum NotifyType { info, warning, error }

showNotify({String message, NotifyType type}) {
  Color _textColor;
  Color _backgroundColor;

  switch (type) {
    case NotifyType.warning:
      _textColor = Colors.black38;
      _backgroundColor = Colors.amber;
      break;
    case NotifyType.error:
      _textColor = Colors.black38;
      _backgroundColor = Colors.deepOrange[300];
      break;
    default:
      break;
  }

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    textColor: _textColor,
    backgroundColor: _backgroundColor,
  );
}
