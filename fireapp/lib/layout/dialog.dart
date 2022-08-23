import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(var text) {
  Fluttertoast.showToast(
      msg: text.toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.black45,
      textColor: Colors.white,
      fontSize: 16.0);
}

void showNothing() {}
