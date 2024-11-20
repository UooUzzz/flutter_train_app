import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/station_list.dart';

class StationBox extends StatelessWidget {
  final Function(String startStation, String endStation) onStationSelected;
  final String? startStation; // 선택된 출발역
  final String? endStation; // 선택된 도착역

  StationBox({
    required this.onStationSelected,
    this.startStation,
    this.endStation,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [  
          // 출발역 선택
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StationListPage(startEnd: '출발'),
                  ),
                );
                if (result != null) {
                  onStationSelected(result, startStation ?? '');
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '출발역',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    startStation ?? '선택',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.grey[400],
            width: 2,
            height: 50,
          ),

          // 도착역 선택
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => StationListPage(startEnd: '도착'),
                  ),
                );
                if (result != null) {
                  onStationSelected(endStation ?? '', result);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '도착역',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    endStation ?? '선택',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
