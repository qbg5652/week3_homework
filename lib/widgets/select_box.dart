import 'package:flutter/material.dart';
import 'package:week3_homework/pages/station_list_page.dart';

class SelectBox extends StatelessWidget {
  SelectBox({
    required this.startStation,
    required this.arrivalStation,
    required this.onSelectedStation,
  });

  final String startStation;
  final String arrivalStation;

  final void Function(String getValue, bool isStartStation) onSelectedStation;

  final List<String> allStations = [
    '수서',
    '동탄',
    '평택지제',
    '천안아산',
    '오송',
    '대전',
    '김천구미',
    '동대구',
    '경주',
    '울산',
    '부산',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white, // 밖에다 두면 색상 적용은 되지만.. BoxDecoration을 사용못함..
      ),
      width: double.infinity,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StationSelect("출발역", startStation, context, arrivalStation),
          VerticalDivider(
            thickness: 2,
            color: Colors.grey,
            width: 100,
            indent: 75,
            endIndent: 75,
          ),

          StationSelect("도착역", arrivalStation, context, startStation),
        ],
      ),
    );
  }

  Widget StationSelect(
    String type,
    String selectStation,
    BuildContext context,
    String otherStation,
  ) {
    return GestureDetector(
      onTap: () {
        print('선택 버튼을 눌렀습니다.');
        List<String> filteredStations =
            allStations.where((station) => station != otherStation).toList();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => StationListPage(
                  appBarTitle: type,
                  stations: filteredStations,
                  onSelectedStation:
                      (value) => onSelectedStation(value, type == "출발역"),
                ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(type, style: TextStyle(color: Colors.grey, fontSize: 16)),
          Text(selectStation, style: TextStyle(fontSize: 40)),
        ],
      ),
    );
  }
}
