abstract class StringValidator{
  bool isValid(String value);
}

class NonEmptyStringValidator extends StringValidator{
  @override
  bool isValid(String value) {
    if(value ==null){
      return false;
    }
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidator {
  final StringValidator emailValidator=NonEmptyStringValidator();
  final StringValidator passwordValidator=NonEmptyStringValidator();
  final String invalidEmailError='The email can\'t be empty';
  final String invalidPasswordError='The password can\'t be empty';
}