import 'package:blog_club7/constants.dart';
import 'package:blog_club7/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defFontFamily = "Avenir";
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: defFontFamily,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
          subtitle1: TextStyle(
            fontFamily: defFontFamily,
            color: secondaryTextColor,
            fontSize: 14,
          ),
          bodyText2: TextStyle(
            fontFamily: defFontFamily,
            color: secondaryTextColor,
            fontSize: 12,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Story> stories = AppDatabase.stories;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi, jonathan!',
                    style: themeData.textTheme.subtitle1,
                  ),
                  Image.asset(
                    'assets/img/icons/notification.png',
                    width: 30,
                    height: 30,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 32, bottom: 24),
              child: Text(
                'Explore today`s',
                style: themeData.textTheme.headline6,
              ),
            ),
            SizedBox(
              height: 110,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 32, right: 32),
                scrollDirection: Axis.horizontal,
                itemCount: stories.length - 1,
                itemBuilder: (BuildContext context, int index) {
                  var story = stories[index + 1];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(3),
                              width: 68,
                              height: 68,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    firstGradientColor,
                                    secondaryTextColor,
                                    thirdGradientColor,
                                  ],
                                  begin: Alignment.topLeft,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image.asset(
                                    'assets/img/stories/${story.imageFileName}',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Image.asset(
                                'assets/img/icons/${story.iconFileName}',
                                width: 24,
                                height: 24,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          story.name,
                          style: themeData.textTheme.bodyText2,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
