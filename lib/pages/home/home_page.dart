import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/home/widgets/station_box.dart';
import 'package:flutter_train_app/pages/seat/seat_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? startStation;
  String? endStation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('기차 예매'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StationBox(
              // StationBox에서 선택된 값 HomePage로 전달
              startStation: startStation,
              endStation: endStation,
              onStationSelected: (start, end) {
                setState(() {
                  startStation = start;
                  endStation = end;
                });
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: (startStation != null && endStation != null)
                    ? () {
                        // 선택된 출발역, 도착역 데이터 전달
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SeatPage(
                                startStation: startStation!,
                                endStation: endStation!,
                              );
                            },
                          ),
                        );
                      }
                    : null, // 출발역, 도착역이 선택되지 않으면 비활성

                child: Text(
                  '좌석 선택',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
