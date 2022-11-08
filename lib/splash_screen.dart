import 'package:blog_club7/gen/assets.gen.dart';
import 'package:blog_club7/home_scree.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
    ).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Assets.img.background.splash.image(fit: BoxFit.cover)),
          Center(child: Assets.img.icons.logo.svg(width: 100)),
        ],
      ),
    );
  }
}
