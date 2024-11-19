import 'package:flutter/material.dart';

class SeatSelectBox extends StatelessWidget {
  SeatSelectBox({
    Key? key,
    this.selectedRow, 
    this.selectedCol,
    required this.onSeatSelected,
  }) : super(key: key);

  final int? selectedRow;
  final String? selectedCol;
  final Function(int, String) onSeatSelected;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                seatColumn('A'),
                seatColumn('B'),
                numberRow(),
                seatColumn('C'),
                seatColumn('D'),
              ],
            ),
          ),
        ],
      ),
    );    
  }

  // 가운데 숫자 박스 함수
  Widget numberRow() {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // List.generate는 숫자 배열을 만드는데 좋은 함수(1부터 시작설정)
        children: List.generate(20, (index) {
          int rowNum = index + 1;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                '$rowNum',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ); 
        }),
      ),
    );
  }





  // A, B, C, D 좌석 한줄로 만드는 함수
  Widget seatColumn(String colLabel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.bottomCenter,
          child: Text(colLabel, style: TextStyle(fontSize: 18)),
        ),
        for (int rowNum = 1; rowNum <= 20; rowNum++)
          GestureDetector(
            onTap: () => onSeatSelected(rowNum, colLabel),
            child: seat(rowNum, colLabel),
          ), 
      ],
    );
  }

  Widget seat(int rowNum, String colLabel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: Container(
        height: 50,
        width: 50,  
        decoration: BoxDecoration(
          color: rowNum == selectedRow && colLabel == selectedCol 
              ? Colors.purple 
              : Colors.grey[300]!,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
