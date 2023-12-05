import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  bool isLengthValid = false;
  bool isUpperCaseValid = false;
  bool isLowerCaseValid = false;
  bool isDigitValid = false;
  bool isSymbolValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _passwordController,
              onChanged: (value) {
                validatePassword(value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
                label: Text("Password"),
                prefixIcon: Icon(CupertinoIcons.lock),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text('Password Strength Indicators:'),
            const SizedBox(height: 10.0),
            buildIndicator('At least 8 characters', isLengthValid),
            buildIndicator('At least one uppercase letter', isUpperCaseValid),
            buildIndicator('At least one lowercase letter', isLowerCaseValid),
            buildIndicator('At least one digit', isDigitValid),
            buildIndicator('At least one symbol', isSymbolValid),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.close,
          color: isValid ? Colors.black : Colors.black38,
        ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: TextStyle(
            decoration:
                isValid ? TextDecoration.none : TextDecoration.lineThrough,
            color: isValid ? Colors.black : Colors.black38,
          ),
        ),
      ],
    );
  }

  void validatePassword(String password) {
    setState(() {
      isLengthValid = password.length >= 8;
      isUpperCaseValid = password.contains(RegExp(r'[A-Z]'));
      isLowerCaseValid = password.contains(RegExp(r'[a-z]'));
      isDigitValid = password.contains(RegExp(r'[0-9]'));
      isSymbolValid = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }
}
