import 'package:flutter/material.dart';
import 'package:flutter_app_first/common_widgets/custom_elevated_button.dart';

class FormSubmitButton extends CustomElevatedButton{
  FormSubmitButton({
    @required String text,
     VoidCallback onPressed,
}):super(
    child:Text(text,
    style: TextStyle(fontSize: 24),),
  foregroundColor: Colors.white,
    onPressed: onPressed,

  );

}