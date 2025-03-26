import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

// 홈 페이지
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("타이틀")),
      body: Column(children: [Text("텍스트"), Text("텍스트")]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // 2번째 페이지 이동
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SecondPage()),
          );
        },
      ),
    );
  }
}

// 2번째 페이지
class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.delete))],
      ),
      body: Column(children: [Text('텍스트')]),
    );
  }
}
