import 'package:blog_club7/article_screen.dart';
import 'package:blog_club7/carousel/carousel_slider.dart';
import 'package:blog_club7/constants.dart';
import 'package:blog_club7/data.dart';
import 'package:blog_club7/gen/assets.gen.dart';
import 'package:blog_club7/gen/fonts.gen.dart';
import 'package:blog_club7/home_scree.dart';
import 'package:blog_club7/profile_screen.dart';
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
        snackBarTheme: SnackBarThemeData(
          backgroundColor: primaryColor,
        ),
        appBarTheme: AppBarTheme(
          titleSpacing: 32,
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
          elevation: 0,
        ),
        colorScheme: ColorScheme.light(
          primary: primaryColor,
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
          bodyText1: TextStyle(
            fontSize: 14,
            color: primaryTextColor,
          ),
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
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> history = [];

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();
  GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    profileIndex: _profileKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      return false;
    } else if (history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = history.last;
        history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavHeight,
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  Navigator(
                    key: _homeKey,
                    onGenerateRoute: (settings) {
                      return MaterialPageRoute(
                        builder: (context) => HomePage(),
                      );
                    },
                  ),
                  Navigator(
                    key: _articleKey,
                    onGenerateRoute: (settings) {
                      return MaterialPageRoute(
                        builder: (context) => ArticleScreen(),
                      );
                    },
                  ),
                  Navigator(
                    key: _searchKey,
                    onGenerateRoute: (settings) {
                      return MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      );
                    },
                  ),
                  Navigator(
                    key: _profileKey,
                    onGenerateRoute: (settings) {
                      return MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigation(
                selectedIndex: selectedScreenIndex,
                onTapped: (index) {
                  setState(() {
                    history.remove(selectedScreenIndex);
                    history.add(selectedScreenIndex);
                    selectedScreenIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Search screen',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  final Function(int index) onTapped;
  final int selectedIndex;

  BottomNavigation({required this.onTapped, required this.selectedIndex});

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
              height: bottomNavHeight,
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
                    isActive: selectedIndex == homeIndex,
                    onTapBtnNav: () {
                      onTapped(homeIndex);
                    },
                    icon: 'Home',
                    activeIcon: 'Home',
                    title: 'Home',
                  ),
                  BottomNavigationItem(
                    isActive: selectedIndex == articleIndex,
                    onTapBtnNav: () {
                      onTapped(articleIndex);
                    },
                    icon: 'Articles',
                    activeIcon: 'Articles',
                    title: 'Articles',
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  BottomNavigationItem(
                    isActive: selectedIndex == searchIndex,
                    onTapBtnNav: () {
                      onTapped(searchIndex);
                    },
                    icon: 'Search',
                    activeIcon: 'Search',
                    title: 'Search',
                  ),
                  BottomNavigationItem(
                    isActive: selectedIndex == profileIndex,
                    onTapBtnNav: () {
                      onTapped(profileIndex);
                    },
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
                  color: primaryColor,
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
  final VoidCallback onTapBtnNav;
  final bool isActive;
  const BottomNavigationItem({
    super.key,
    this.icon,
    this.activeIcon,
    this.title,
    required this.onTapBtnNav,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTapBtnNav,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isActive
                ? Container(
                    height: 5,
                    width: 25,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: primaryTextColor,
                        )
                      ],
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  )
                : SizedBox(),
            SizedBox(height: 5),
            Image.asset('assets/img/icons/$icon.png'),
            SizedBox(
              height: 4,
            ),
            Text(
              title!,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
