import 'package:flutter/material.dart';

class MyPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  MyPasswordTextField({required this.title, required this.controller});

  @override
  State<MyPasswordTextField> createState() => _MyPasswordTextFieldState();
}

class _MyPasswordTextFieldState extends State<MyPasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText == true ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        fillColor: Color.fromARGB(255, 182, 127, 145),
        filled: true,
        hintText: widget.title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
