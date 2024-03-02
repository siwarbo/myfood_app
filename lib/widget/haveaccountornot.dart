import 'package:flutter/material.dart';

class HaveAccountOrNot extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  HaveAccountOrNot({
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
          children: <TextSpan>[
            TextSpan(
              text: subTitle,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
