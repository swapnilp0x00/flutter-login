class ValidationMixin {
  String? validatePassword(String? value) {
    value = value as String;
    if (value.length > 4) {
      return null;
    } else {
      return 'Invalid password';
    }
  }

  String? validateEmail(String? value) {
        if (value is String && value.contains('@')) {
          return null;
        } else {
          return 'Invalid Email';
        }
      }
}
