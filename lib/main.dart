import 'package:blog_club7/carousel/carousel_slider.dart';
import 'package:blog_club7/constants.dart';
import 'package:blog_club7/data.dart';
import 'package:blog_club7/gen/assets.gen.dart';
import 'package:blog_club7/gen/fonts.gen.dart';
import 'package:blog_club7/splash_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: firstGradientColor,
          onPrimary: Colors.white,
          onSurface: primaryTextColor,
          onBackground: primaryTextColor,
          background: Color(0xfffbfcff),
          surface: Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 14,
                color: Color(0xff376aed),
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.avenir,
              ),
            ),
          ),
        ),
        textTheme: TextTheme(
          caption: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            fontSize: 10,
            color: Color(0xff7b8bb2),
          ),
          headline6: TextStyle(
            fontSize: 18,
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
          subtitle1: TextStyle(
            fontFamily: FontFamily.avenir,
            color: secondaryTextColor,
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
          subtitle2: TextStyle(
            fontFamily: FontFamily.avenir,
            color: primaryTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          bodyText2: TextStyle(
            fontFamily: FontFamily.avenir,
            color: secondaryTextColor,
            fontSize: 12,
          ),
          headline4: TextStyle(
            fontFamily: FontFamily.avenir,
            fontSize: 24,
            color: primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            fontFamily: FontFamily.avenir,
            fontSize: 20,
            color: primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: Stack(
      //   children: [
      //     Positioned.fill(child: SplashScreen()),
      //     Positioned(
      //       bottom: 0,
      //       left: 0,
      //       right: 0,
      //       child: BottomNavigation(),
      //     ),
      //   ],
      // ),
      home: SplashScreen(),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color(0xff9b8487).withOpacity(.3),
                  ),
                ],
                color: Colors.white,
              ),
              //  Bottom nav Item
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                    icon: 'Home',
                    activeIcon: 'Home',
                    title: 'Home',
                  ),
                  BottomNavigationItem(
                    icon: 'Articles',
                    activeIcon: 'Articles',
                    title: 'Articles',
                  ),
                  SizedBox(width: 8),
                  BottomNavigationItem(
                    icon: 'Search',
                    activeIcon: 'Search',
                    title: 'Search',
                  ),
                  BottomNavigationItem(
                    icon: 'Menu',
                    activeIcon: 'Menu',
                    title: 'Menu',
                  ),
                ],
              ),
            ),
          ),
          // plus button
          Center(
            child: Container(
              height: 85,
              width: 65,
              alignment: Alignment.topCenter,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  color: firstGradientColor,
                  borderRadius: BorderRadius.circular(32.5),
                ),
                child: Image.asset('assets/img/icons/plus.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String? icon, title, activeIcon;
  const BottomNavigationItem({
    super.key,
    this.icon,
    this.title,
    this.activeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/$icon.png'),
        SizedBox(
          height: 4,
        ),
        Text(
          title!,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
