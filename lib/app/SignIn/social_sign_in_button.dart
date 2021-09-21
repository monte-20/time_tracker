import 'package:flutter/material.dart';
import 'package:flutter_app_first/common_widgets/custom_elevated_button.dart';

class SocailSignInButton extends CustomElevatedButton {
  SocailSignInButton({
    String assetName,
    String text,
    Color backgroundColor,
    Color foregroundColor,
    VoidCallback onPressed,
  }) : super(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Image.asset(assetName),
          Text(
            text,
            style: TextStyle(fontSize: 14),
          ),
          Opacity(opacity: 0, child: Image.asset(assetName)),
        ],
      ),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      onPressed: onPressed);
}
