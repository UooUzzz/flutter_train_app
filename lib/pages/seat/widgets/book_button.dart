import 'package:flutter/material.dart';

class BookButton extends StatelessWidget {
  const BookButton({
    Key? key,
    this.selectedRow, 
    this.selectedCol,
    required this.showSeatDialog,
  }) : super(key: key);

  final int? selectedRow;
  final String? selectedCol;
  final VoidCallback showSeatDialog;


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        child: Container(
          height: 100,
          width: double.infinity, //Container에 child가 있으면 child에 너비를 맞추려고 해서 이렇게 설정해줌
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
      Positioned(
        left: 20,
        right: 20,
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: showSeatDialog,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              '예매 하기',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
