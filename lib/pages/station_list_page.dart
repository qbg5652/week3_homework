import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  StationListPage({required this.appBarTitle, required this.onSelectedStation});

  final String appBarTitle;
  final void Function(String getValue) onSelectedStation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
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
  }
}
