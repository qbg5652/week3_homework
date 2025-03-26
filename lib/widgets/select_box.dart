import 'package:flutter/material.dart';

class SelectBox extends StatelessWidget {
  const SelectBox({super.key});

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
          StationSelect("출발역", "선택"),
          VerticalDivider(
            thickness: 2,
            color: Colors.grey,
            width: 100,
            indent: 75,
            endIndent: 75,
          ),

          StationSelect("도착역", "선택"),
        ],
      ),
    );
  }

  Widget StationSelect(String text, String selectStation) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: TextStyle(color: Colors.grey, fontSize: 16)),
        Text(selectStation, style: TextStyle(fontSize: 40)),
      ],
    );
  }
}
