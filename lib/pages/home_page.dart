import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week3_homework/pages/seat_page.dart';
import 'package:week3_homework/pages/station_list_page.dart';
import 'package:week3_homework/widgets/select_box.dart';

// 홈 페이지
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String startStation = '선택';
  String arrivalStation = '선택';

  void onSelectedStation(String selectST, bool isStartStation) {
    setState(() {
      if (isStartStation) {
        startStation = selectST;
      } else {
        arrivalStation = selectST;
      }
    });
  }

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
              SelectBox(
                startStation: startStation,
                arrivalStation: arrivalStation,
                onSelectedStation: onSelectedStation,
              ),
              SizedBox(height: 20),

              // 좌석 선택 버튼
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
                  onPressed: () {
                    print('좌석선택 버튼을 눌렀습니다.');
                    if (startStation != '선택' && arrivalStation != '선택') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SeatPage()),
                      );
                    } else {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text("목적지를 선택해주세요."),
                            content: Text(
                              "목적지를 선택 안하면 좌석을 예약할 수 없어요. 아래 선택한 출발역과 도착역을 확인해주세요. \n출발역 : $startStation\n도착역 : $arrivalStation",
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: Text(
                                  "확인",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
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
    );
  }
}
