import 'package:flutter_app_first/app/SignIn/validators.dart';
import 'package:flutter_test/flutter_test.dart';

main(){
test('empty string test',(){
  final validator=NonEmptyStringValidator();
  expect(validator.isValid('abc'), true);
});
}