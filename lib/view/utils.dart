import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ///Dismiss the keyboard
  void dismissKeyboard(BuildContext context) =>
      FocusScope.of(context).requestFocus(FocusNode());
}
