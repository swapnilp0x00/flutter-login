import 'package:flutter/material.dart';
import 'package:login/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Form(
          key: formKey,
          child: Column(
            children: [
              emailField(),
              passwordField(),
              Container(margin: const EdgeInsets.only(bottom: 25)),
              submitButton(),
            ],
          )),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'you@gmail.com',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (String? value) {
        value = value as String;
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: validatePassword,
      onSaved: (String? value) {
        value = value as String;
        password = value;
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        bool valid = formKey.currentState?.validate() as bool;
        if (valid) {
          formKey.currentState?.save();
          // ignore: avoid_print
          print('Value submitted $email and $password');
          print(formKey.currentState);
        }
      },
      child: const Text('Button'),
    );
  }
}
