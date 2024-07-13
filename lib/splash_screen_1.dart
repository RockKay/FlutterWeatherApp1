import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'main.dart';
import 'dart:async';

void main() {
  runApp(SplashApp());
}

class SplashApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Tạo độ trễ 5 giây trước khi chuyển đến trang chính
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Màu nền của Splash Screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitCircle(
              // Hiệu ứng quay tròn
              color: Colors.white,
              size: 50.0,
            ),
            SizedBox(height: 20.0),
            Flexible(
              child: Image.asset(
                'assets/images/icon/Android Large - 1.png',
                fit: BoxFit.contain,
              ),
            ),
          ], // Hình ảnh Splash Screen từ assets
        ),
      ),
    );
  }
}
