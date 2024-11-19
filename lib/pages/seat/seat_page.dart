import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/widgets/book_button.dart';
import 'package:flutter_train_app/pages/seat/widgets/chose_color.dart';
import 'package:flutter_train_app/pages/seat/widgets/seat_select_box.dart';
import 'package:flutter_train_app/pages/seat/widgets/station_box2.dart';

class SeatPage extends StatefulWidget{
  final String startStation;
  final String endStation;

  SeatPage({required this.startStation, required this.endStation});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {

  int? selectedRow;
  String? selectedCol;

  // 예매하기 버튼
  void showSeat() {
    showCupertinoDialog(
      context: context, 
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('예매 하시겠습니까?'),
          content: Text('좌석 : $selectedRow-$selectedCol'),
          actions: [
            CupertinoDialogAction(
              child: Text(
                '취소', 
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // 취소버튼 동작
              },
            ),
            CupertinoDialogAction(
              child: Text(
                '확인',
                style: TextStyle(
                  color: Colors.blue
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // 확인버튼 동작
              },
            )
          ],
        );
      } 
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: 
        Column(
          children: [
            // StationBox2에 startStation과 endStation 전달
            StationBox2(
              startStation: widget.startStation,
              endStation: widget.endStation,
            ),
            ChoseColor(),
            SeatSelectBox(
              selectedRow: selectedRow, 
              selectedCol: selectedCol,
              onSeatSelected: (int row, String col) {
                setState(() {
                  selectedRow = row;
                  selectedCol = col;
                });
              },
            ),
            BookButton(
              selectedRow: selectedRow, 
              selectedCol: selectedCol,
              showSeatDialog: showSeat,
            ),
          ],
        ),
    );
  }
}