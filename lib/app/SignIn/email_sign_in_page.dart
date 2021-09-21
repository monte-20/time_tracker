import 'package:flutter/material.dart';
import 'package:flutter_app_first/app/SignIn/email_sign_in_form_bloc_based.dart';
import 'package:flutter_app_first/app/SignIn/email_sign_in_form_stateful.dart';
import 'package:flutter_app_first/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign in',
          textAlign: TextAlign.center,
        ),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: EmailSignInFormBlocBased.create(context),
            color: Colors.white70,
          ),
        ),
      ),
      backgroundColor: Colors.blue[100],
    );
  }
}
