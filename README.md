# SIMPLE_UI_KW
it is a package that we made for study
## animation button 
### Getting started

    class AnimationButton extends StatefulWidget {
    final IconData iconTarget;
    final Color? targetColor;
    final double? targetSize;
    final VoidCallback onChanged;
    final IconData animatedIcon;
    final Color? iconColor;
    final double? size;
    final Duration? duration;
    final Curve curve;
    final double iconSize;
  
    const AnimationButton({super.key, 
      required this.iconTarget,
      this.targetColor = Colors.black,
      this.targetSize = 70,
      required this.onChanged,
      this.animatedIcon = Icons.favorite,
      this.iconColor = const Color(0xFFF5F5F5),
      this.size = 70,
      this.duration = const Duration(milliseconds: 500),
      this.curve = Curves.easeInOut,
      this.iconSize = 120,
    });
  
## video splash page
### Getting started
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


![image](https://github.com/jspark9703/simple_ui_kw/assets/67131959/f437e2d7-7c38-4138-b242-fe541f33bb57)

![image](https://github.com/jspark9703/simple_ui_kw/assets/67131959/86c6a112-3a62-416b-a319-54be067563ed)

    

## Usage



```dart
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
                animatedIcon: Icons.ac_unit,
                iconColor: Colors.lightBlue,
                onChanged: () {
    print("tap"); // 탭 이벤트 발생 시 원하는 동작을 설정하세요.
                },),)
          ),
        );
      }
    }



```


