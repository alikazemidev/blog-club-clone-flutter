import 'package:blog_club7/data.dart';
import 'package:blog_club7/gen/assets.gen.dart';
import 'package:blog_club7/home_scree.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    var posts = AppDatabase.posts;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.background.withOpacity(0),
        title: Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz_rounded),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(32, 8, 32, 32),
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color:
                            themeData.colorScheme.onBackground.withOpacity(.1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Assets.img.stories.story3.image(
                                width: 84,
                                height: 84,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('@daineles'),
                                  SizedBox(height: 4),
                                  Text(
                                    'dainel esmit',
                                    style:
                                        themeData.textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'flutter developer',
                                    style: themeData.textTheme.bodyText1!.apply(
                                      color: themeData.colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'About me',
                          style: themeData.textTheme.headline6,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temporLorem ipsum dolor sit am',
                          style: themeData.textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 96,
                  right: 96,
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 30,
                          color: themeData.colorScheme.onBackground
                              .withOpacity(0.8),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 64,
                  right: 64,
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: themeData.colorScheme.primary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromARGB(255, 42, 3, 148),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '52',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: themeData.colorScheme.onPrimary,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Post',
                                  style:
                                      themeData.textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: themeData.colorScheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '250',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: themeData.colorScheme.onPrimary,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Following',
                                style: themeData.textTheme.bodyText1!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: themeData.colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.5k',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: themeData.colorScheme.onPrimary,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Followers',
                                style: themeData.textTheme.bodyText1!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: themeData.colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: themeData.colorScheme.onBackground.withOpacity(.1),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'My Posts',
                            style: themeData.textTheme.headline6,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.img.icons.home.image(),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.img.icons.home.image(),
                        ),
                      ],
                    ),
                  ),
                  for (int i = 0; i < posts.length; i++)
                    PostListItem(
                      post: posts[i],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
