import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  const StationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("출발역"), centerTitle: true), // 이것도 나중에 변수로 처리
      body: Column(
        children: [
          StationList('수서'),
          StationList('동탄'),
          StationList('평택지제'),
          StationList('천안아산'),
          StationList('오송'),
          StationList('대전'),
          StationList('김천구미'),
          StationList('동대구'),
          StationList('경주'),
          StationList('울산'),
          StationList('부산'),
        ],
      ),
    );
  }

  Widget StationList(String stationName) {
    return Container(
      alignment: Alignment.centerLeft, // 텍스트의 왼쪽 가운데 정렬
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1),
        ), //Colors.grey[300]이 안되어서, 해당 색상의 다른 코드로 대체함.
      ),
      height: 50,
      child: Text(
        '    $stationName',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );

    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Text(
    //       stationName,
    //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    //     ),
    //     Divider(thickness: 1, color: Colors.grey[300], height: 30),
    //   ],
    // );
  }
}
