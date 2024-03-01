import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title, subsTitle;
  TopTitle({required this.subsTitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 40,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subsTitle,
            style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
