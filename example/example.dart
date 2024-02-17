import 'package:flutter/material.dart';
import 'package:simple_ui_kw/button_animation.dart';
import 'package:simple_ui_kw/video_splash_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('simple ui kw 예제'),
        ),
        body: VideoSplashScreen(title: "Example",videoPath: "assets/background.mp4",customButton: AnimationButton( iconTarget: Icons.ac_unit, // 원하는 아이콘을 설정하세요.
            targetColor: Colors.blueGrey,
            icon: Icons.ac_unit,
            iconColor: Colors.lightBlue,
            onChanged: () {
print("tap"); // 탭 이벤트 발생 시 원하는 동작을 설정하세요.
            },),)
      ),
    );
  }
}