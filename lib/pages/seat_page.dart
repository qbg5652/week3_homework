import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({required this.startStation, required this.arrivalStation});

  final String startStation;
  final String arrivalStation;

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  // 21행 × 5열
  List<List<bool>> seatsSelected = List.generate(
    21,
    (_) => List.generate(5, (_) => false),
  );

  // 열 인덱스(0~4)에 대응되는 알파벳
  final List<String> columnLetters = ["A", "B", "", "C", "D"];
  // (rowIndex, colIndex) => "A - 1" 같은 문자열
  String getSeatLabel(int rowIndex, int columnIndex) {
    final colLetter = columnLetters[columnIndex]; // A/B/( )/C/D
    if (colLetter.isEmpty) {
      return "${rowIndex}"; // 공백열이면 => 숫자만
    } else {
      return "$colLetter - $rowIndex";
    }
  }

  // 예매 버튼 눌렀을 때, 선택된 좌석 목록을 합쳐서 보여줄 때 쓰는 함수
  String getSelectedSeatString() {
    List<String> selectedList = [];
    for (int r = 0; r < 21; r++) {
      for (int c = 0; c < 5; c++) {
        if (seatsSelected[r][c]) {
          // 이 좌석이 선택됨
          final label = getSeatLabel(r, c);
          selectedList.add(label);
        }
      }
    }
    return selectedList.join(", ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("좌석 선택"), centerTitle: true),
      body: Stack(
        children: [
          ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  stationName(widget.startStation),
                  SizedBox(width: 50),
                  Icon(Icons.arrow_circle_right_outlined, size: 30),
                  SizedBox(width: 50),
                  stationName(widget.arrivalStation),
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
                  // 첫 줄 (행 0)만 별도로 출력.(A/B//C/D)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      seatBox(0, 0),
                      seatBox(0, 1),
                      seatBox(0, 2),
                      seatBox(0, 3),
                      seatBox(0, 4),
                    ],
                  ),
                  // 1행부터 20행까지 출력
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
                    final String seatString =
                        getSelectedSeatString(); // 선택된 좌석 모아오기

                    showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text("예매하시겠습니까?"),
                          content: Text(
                            seatString.isEmpty
                                ? "아직 좌석을 선택하지 않으셨습니다."
                                : "좌석 : $seatString",
                          ),
                          actions: [
                            CupertinoDialogAction(
                              //취소버튼
                              child: Text(
                                "취소",
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                //취소버튼 눌렀을 시 동작
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoDialogAction(
                              //확인버튼
                              child: Text(
                                "확인",
                                style: TextStyle(color: Colors.blue),
                              ),
                              onPressed: () {
                                //
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
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
        seatBox(rowNum, 0),
        seatBox(rowNum, 1),
        seatBox(rowNum, 2),
        seatBox(rowNum, 3),
        seatBox(rowNum, 4),
      ],
    );
  }

  Widget seatBox(int rowIndex, int columnIndex) {
    final bool isSelected = seatsSelected[rowIndex][columnIndex];

    final bool forceWhite = (rowIndex == 0 || columnIndex == 2);
    //  ||
    // (rowIndex == 0 && columnIndex == 2);

    // final Color currentColor = isSelected ? Colors.purple : Colors.grey[300]!;

    final Color currentColor =
        forceWhite
            ? Colors.white.withOpacity(0)
            : (isSelected ? Colors.purple : Colors.grey[300]!);

    // Row가 0이면 문자 표시, 나머진 숫자.
    String textForContainer;
    if (rowIndex == 0) {
      // A, B, ( ), C, D
      textForContainer = columnLetters[columnIndex];
    } else if (columnIndex == 2) {
      // 1~20행이면 => 숫자만 (rowIndex)
      textForContainer = rowIndex.toString();
    } else {
      // 1~20행이면 => 숫자만 (rowIndex)
      textForContainer = '';
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          seatsSelected[rowIndex][columnIndex] =
              !seatsSelected[rowIndex][columnIndex];
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        height: 50,
        width: 50,

        child: Text(textForContainer),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: currentColor,
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
