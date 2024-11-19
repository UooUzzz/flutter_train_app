import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget{
  final String startEnd;

  StationListPage({required this.startEnd});

  final List<String> stationNames = ['수서', '동탄', '평택지제', '천안아산', '오송', '대전', '김천구미', '동대구', '경주', '울산', '부산'];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$startEnd역'),
      ),
      body: ListView.builder(
        itemCount: stationNames.length,
        itemBuilder: (context, index) {
          //ListTile은 flutter 위젯
          return GestureDetector(
            onTap: () {
              Navigator.pop(context, stationNames[index]);
            },
            child: stationName(stationNames[index]),
          );
        },
      ),
    );
  }

  Container stationName(String text) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}