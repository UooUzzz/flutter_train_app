

import 'package:flutter/material.dart';

class StationBox2 extends StatelessWidget {
  final String startStation;
  final String endStation;

  const StationBox2({
    Key? key,
    required this.startStation,
    required this.endStation,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          startStation,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        SizedBox(width: 50),
        Icon(Icons.arrow_circle_right_outlined, size: 30),
        SizedBox(width: 50),
        Text(
          endStation,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
      ],
    );
  }
}