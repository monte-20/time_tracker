import 'package:flutter/material.dart';
import 'package:flutter_app_first/app/SignIn/validators.dart';
import 'package:flutter_app_first/services/auth.dart';

enum EmailSignInFormType { signIn, Register }

class EmailSignInChangeModel with EmailAndPasswordValidator,ChangeNotifier {
  EmailSignInChangeModel({
    @required this.auth,
    this.password = ' ',
    this.email = ' ',
    this.formType = EmailSignInFormType.signIn,
    this.isLoading = false,
    this.submitted = false,
  });
  final AuthBase auth;
  String password;
  String email;
  EmailSignInFormType formType;
  bool isLoading;
  bool submitted;


  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
      if (formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmailAndPassword(email, password);
      } else {
        await auth.createUserWithEmailAndPassword(
            email, password);
      }
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }
  String get primaryTextButton {
    return formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create an account';
  }

  String get secondaryTextButton {
    return formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';
  }

  bool get canSubmit {
    return emailValidator.isValid(email) &&
        passwordValidator.isValid(password) &&
        !isLoading;
  }

  String get passwordErrorText {
    bool showTextError = submitted && !passwordValidator.isValid(password);
    return showTextError ? invalidPasswordError : null;
  }

  String get emailErrorText {
    bool showTextError = submitted && !emailValidator.isValid(email);
    return showTextError ? invalidEmailError : null;
  }
  void toggleFormType() {
    final formType = this.formType == EmailSignInFormType.signIn
        ? EmailSignInFormType.Register
        : EmailSignInFormType.signIn;
    updateWith(
      email: '',
      password: '',
      formType: formType,
      isLoading: false,
      submitted: false,
    );
  }

  void updateEmail(String email) => updateWith(email: email);

  void updatePassword(String password) => updateWith(password: password);

  void updateWith({
    String password,
    String email,
    EmailSignInFormType formType,
    bool isLoading,
    bool submitted,
  }) {

      this.email= email ?? this.email;
      this.password= password ?? this.password;
      this.formType=formType ?? this.formType;
      this.isLoading= isLoading ?? this.isLoading;
      this.submitted= submitted ?? this.submitted;
    notifyListeners();
  }
}
