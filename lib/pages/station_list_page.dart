import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  const StationListPage(this.onSelectedStation);

  // final   selectStation;
  // final String arrivalStation;
  final void Function(String getValue) onSelectedStation;

  // final String selectStation;
  // selectStation == "출발역" ? "출발역" : "도착역"
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("출발역"), centerTitle: true), // 이것도 나중에 변수로 처리
      body: Column(
        children: [
          StationList('수서', context),
          StationList('동탄', context),
          StationList('평택지제', context),
          StationList('천안아산', context),
          StationList('오송', context),
          StationList('대전', context),
          StationList('김천구미', context),
          StationList('동대구', context),
          StationList('경주', context),
          StationList('울산', context),
          StationList('부산', context),
        ],
      ),
    );
  }

  Widget StationList(String stationName, BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectedStation(stationName);
        Navigator.pop(context);
      },
      child: Container(
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
