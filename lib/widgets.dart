import 'package:flutter/material.dart';

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(fontSize: 15, backgroundColor: Colors.red),
    ),
    action: SnackBarAction(
      label: 'ok',
      onPressed: () {},
      textColor: Colors.green,
    ),
  ));
}
