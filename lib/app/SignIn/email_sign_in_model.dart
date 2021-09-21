import 'package:flutter_app_first/app/SignIn/validators.dart';

enum EmailSignInFormType { signIn, Register }

class EmailSignInModel with EmailAndPasswordValidator {
  EmailSignInModel({
    this.password = ' ',
    this.email = ' ',
    this.formType = EmailSignInFormType.signIn,
    this.isLoading = false,
    this.submitted = false,
  });

  final String password;
  final String email;
  final EmailSignInFormType formType;
  final bool isLoading;
  final bool submitted;

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

  EmailSignInModel copyWith({
    String password,
    String email,
    EmailSignInFormType formType,
    bool isLoading,
    bool submitted,
  }) {
    return EmailSignInModel(
      email: email ?? this.email,
      password: password ?? this.password,
      formType: formType ?? this.formType,
      isLoading: isLoading ?? this.isLoading,
      submitted: submitted ?? this.submitted,
    );
  }
}
