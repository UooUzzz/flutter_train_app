

import 'package:flutter/material.dart';

class ChoseColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        chosen('선택됨', Colors.purple),
        SizedBox(width: 20),
        chosen('선택안됨', Colors.grey[300]!),
      ],
    );
  }

  Row chosen(String text, Color color) {
    return Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(width: 4),
          Text('$text'),
        ],
      );
  }
}