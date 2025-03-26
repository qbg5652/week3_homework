import 'package:flutter/material.dart';
import 'package:week3_homework/pages/station_list_page.dart';

class SelectBox extends StatelessWidget {
  const SelectBox({
    required this.startStation,
    required this.arrivalStation,
    required this.onSelectedStation,
  });

  final String startStation;
  final String arrivalStation;

  final void Function(String getValue) onSelectedStation;

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
          StationSelect("출발역", startStation, context),
          VerticalDivider(
            thickness: 2,
            color: Colors.grey,
            width: 100,
            indent: 75,
            endIndent: 75,
          ),

          StationSelect("도착역", arrivalStation, context),
        ],
      ),
    );
  }

  Widget StationSelect(
    String text,
    String selectStation,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        print('선태 버튼을 눌렀습니다.');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StationListPage(selectStation: selectStation),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(color: Colors.grey, fontSize: 16)),
          Text(selectStation, style: TextStyle(fontSize: 40)),
        ],
      ),
    );
  }
}
