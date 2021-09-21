import 'package:flutter/material.dart';
import 'package:flutter_app_first/common_widgets/custom_elevated_button.dart';

class SignInButton extends CustomElevatedButton {
  SignInButton({
    String text,
    Color backgroundColor,
    Color foregroundColor,
    VoidCallback onPressed,
  }) : super(
            child: Text(text,style: TextStyle(fontSize: 15.0),),
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            onPressed: onPressed);
}
