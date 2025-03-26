import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  const SeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("좌석 선택"), centerTitle: true), // 이것도 나중에 변수로 처리
      body: Stack(
        children: [
          ListView(
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      seatBox('A', Colors.white.withOpacity(0)),
                      seatBox('B', Colors.white.withOpacity(0)),
                      seatBox('', Colors.white.withOpacity(0)),
                      seatBox('C', Colors.white.withOpacity(0)),
                      seatBox('D', Colors.white.withOpacity(0)),
                    ],
                  ),
                  for (int i = 1; i <= 20; i++) rowSeatBox(i),
                ],
              ),
              SizedBox(height: 80),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, //버튼색상
                    foregroundColor: Colors.white, //글자색상
                    shape: RoundedRectangleBorder(
                      //둥글기 설정
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    print('예매하기 버튼을 눌렀습니다.');
                  },
                  child: Text(
                    "예매하기",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rowSeatBox(int rowNum) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
    return GestureDetector(
      onTap: () {
        print('좌석을 눌렀습니다.');
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        height: 50,
        width: 50,

        child: Text('$locationNum'),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: boxColor,
        ),
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
