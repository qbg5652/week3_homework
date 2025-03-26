import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  const SeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("좌석 선택"), centerTitle: true), // 이것도 나중에 변수로 처리
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              stationName("출발역명"),
              SizedBox(width: 50),
              Icon(Icons.arrow_circle_right_outlined, size: 30),
              SizedBox(width: 50),
              stationName("도착역명"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.purple,
                    ),
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 4),
                  Text("선택됨"),
                ],
              ),
              SizedBox(width: 20),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[300],
                    ),
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 4),
                  Text("선택안됨"),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  seatBox('A', Colors.white.withOpacity(0)),
                  seatBox('B', Colors.white.withOpacity(0)),
                  seatBox('', Colors.white.withOpacity(0)),
                  seatBox('C', Colors.white.withOpacity(0)),
                  seatBox('D', Colors.white.withOpacity(0)),
                ],
              ),
              rowSeatBox(1),
              rowSeatBox(2),
              rowSeatBox(3),
              rowSeatBox(4),
              rowSeatBox(5), //리스트뷰로 구현
            ],
          ),
        ],
      ),
    );
  }

  Widget rowSeatBox(int rowNum) {
    return Row(
      children: [
        seatBox('', Colors.grey[300]),
        seatBox('', Colors.grey[300]),
        seatBox('$rowNum', Colors.white.withOpacity(0)),
        seatBox('', Colors.grey[300]),
        seatBox('', Colors.grey[300]),
      ],
    );
  }

  Widget seatBox(String? locationNum, Color? boxColor) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      height: 50,
      width: 50,

      child: Text('$locationNum'),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: boxColor,
      ),
    );
  }

  Widget stationName(String stationName) {
    return Text(
      stationName,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.purple,
      ),
    );
  }
}
