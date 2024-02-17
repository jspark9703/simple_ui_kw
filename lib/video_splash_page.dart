import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoSplashScreen extends StatefulWidget {
  final String videoPath;
  final String title;
  final Widget customButton; // 사용자 정의 버튼을 위한 새로운 파라미터

  const VideoSplashScreen({
    required this.videoPath,
    required this.title,
    required this.customButton, // 필수 인자로 변경
    Key? key,
  }) : super(key: key);

  @override
  _VideoSplashScreenState createState() => _VideoSplashScreenState();
}

class _VideoSplashScreenState extends State<VideoSplashScreen> {
  late VideoPlayerController _controller;
  late Timer _timer;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
    _timer = Timer(const Duration(seconds: 5), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          VideoPlayer(_controller),
          AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0.0,
            duration: const Duration(seconds: 2),
            child: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 300), // 제목 위치 조정
                  Text(widget.title, style: const TextStyle(fontSize: 24.0, color: Colors.white)),
                  const SizedBox(height: 200), // 버튼 위치 조정
                  widget.customButton, // 사용자가 제공한 버튼 위젯을 사용
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
