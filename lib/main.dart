import 'package:blog_club7/carousel/carousel_slider.dart';
import 'package:blog_club7/constants.dart';
import 'package:blog_club7/data.dart';
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
  static const defFontFamily = "Avenir";
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 14,
                color: Color(0xff376aed),
                fontWeight: FontWeight.w400,
                fontFamily: defFontFamily,
              ),
            ),
          ),
        ),
        textTheme: TextTheme(
          caption: TextStyle(
            fontFamily: defFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 10,
            color: Color(0xff7b8bb2),
          ),
          headline6: TextStyle(
            fontSize: 18,
            fontFamily: defFontFamily,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
          subtitle1: TextStyle(
            fontFamily: defFontFamily,
            color: secondaryTextColor,
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
          subtitle2: TextStyle(
            fontFamily: defFontFamily,
            color: primaryTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          bodyText2: TextStyle(
            fontFamily: defFontFamily,
            color: secondaryTextColor,
            fontSize: 12,
          ),
          headline4: TextStyle(
            fontFamily: defFontFamily,
            fontSize: 24,
            color: primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            fontFamily: defFontFamily,
            fontSize: 20,
            color: primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          Positioned.fill(child: HomePage()),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigation(),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<StoryData> stories = AppDatabase.stories;
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
                    width: 32,
                    height: 32,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 32, bottom: 16),
              child: Text(
                'Explore today`s',
                style: themeData.textTheme.headline4,
              ),
            ),
            StoryList(stories: stories, themeData: themeData),
            SizedBox(height: 16),
            CategoryList(),
            PostList(),
            SizedBox(height: 32)
          ],
        ),
      ),
    ));
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) {
        return CategoryItem(
          left: realIndex == 0 ? 32 : 8,
          right: realIndex == categories.length - 1 ? 32 : 8,
          category: categories[realIndex],
        );
      },
      options: CarouselOptions(
        scrollPhysics: BouncingScrollPhysics(),
        initialPage: 0,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        viewportFraction: 0.8,
        enableInfiniteScroll: false,
        aspectRatio: 1.2,
        disableCenter: true,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;
  final double left, right;
  const CategoryItem({
    Key? key,
    required this.category,
    required this.left,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          Positioned.fill(
            left: 65,
            right: 65,
            top: 100,
            bottom: 24,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff0d253c),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(32),
              ),
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    firstCaruselGradientColor,
                    secondCaruselGradientColor,
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 32,
            child: Text(
              category.title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .apply(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class StoryList extends StatelessWidget {
  const StoryList({
    Key? key,
    required this.stories,
    required this.themeData,
  }) : super(key: key);

  final List<StoryData> stories;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 32, right: 32),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length - 1,
        itemBuilder: (BuildContext context, int index) {
          var story = stories[index + 1];
          return Story(story: story, themeData: themeData);
        },
      ),
    );
  }
}

class Story extends StatelessWidget {
  const Story({
    Key? key,
    required this.story,
    required this.themeData,
  }) : super(key: key);

  final StoryData story;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? profileImageViewed() : profileImageNormal(),
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
  }

  Widget profileImageNormal() {
    return Container(
      padding: EdgeInsets.all(2),
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
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: profileImage(),
      ),
    );
  }

  Widget profileImageViewed() {
    return SizedBox(
      height: 68,
      width: 68,
      child: DottedBorder(
        radius: Radius.circular(24),
        padding: EdgeInsets.all(7),
        borderType: BorderType.RRect,
        strokeWidth: 2,
        color: dottedBorderColor,
        dashPattern: [8, 3],
        child: Container(
          padding: EdgeInsets.all(2),
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: profileImage(),
        ),
      ),
    );
  }

  Widget profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.asset(
        'assets/img/stories/${story.imageFileName}',
      ),
    );
  }
}

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 16, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Latest News',
                style: Theme.of(context).textTheme.headline5,
              ),
              TextButton(
                onPressed: () {},
                child: Text('More'),
              ),
            ],
          ),
        ),
        // list of posts
        ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemExtent: 141,
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            final post = posts[index];
            return PostListItem(post: post);
          },
        ),
      ],
    );
  }
}

class PostListItem extends StatelessWidget {
  const PostListItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Color(0xff5282ff).withOpacity(0.09),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/img/posts/small/${post.imageFileName}',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    post.caption,
                    style: TextStyle(
                      fontFamily: MyApp.defFontFamily,
                      color: firstGradientColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            CupertinoIcons.hand_thumbsup,
                            size: 16,
                            color: Theme.of(context).textTheme.bodyText2!.color,
                          ),
                          SizedBox(width: 4),
                          Text(post.likes)
                        ],
                      ),
                      SizedBox(width: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            color: Theme.of(context).textTheme.bodyText2!.color,
                            CupertinoIcons.clock,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(post.time)
                        ],
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            color: Theme.of(context).textTheme.bodyText2!.color,
                            post.isBookmarked
                                ? CupertinoIcons.bookmark_fill
                                : CupertinoIcons.bookmark,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
