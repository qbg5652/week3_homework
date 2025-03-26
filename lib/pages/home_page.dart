import 'package:flutter/material.dart';
import 'package:week3_homework/pages/seat_page.dart';
import 'package:week3_homework/pages/station_list_page.dart';
import 'package:week3_homework/widgets/select_box.dart';

// 홈 페이지
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("기차 예매"), centerTitle: true),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectBox(),
              SizedBox(height: 20),
              SizedBox(
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
                  onPressed: () {},
                  child: Text(
                    "좌석 선택",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // 2번째 페이지 이동
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SeatPage()),
          );
        },
      ),
    );
  }
}
