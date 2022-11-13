import 'package:blog_club7/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          showSnackBar(context, 'like btn clicked');
        },
        child: Container(
          width: 111,
          height: 48,
          decoration: BoxDecoration(
            color: themeData.colorScheme.primary,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: themeData.colorScheme.primary.withOpacity(.5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              SizedBox(width: 8),
              Text(
                '1.2k',
                style: TextStyle(
                  color: themeData.colorScheme.onPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: themeData.colorScheme.surface,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('Article'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz_rounded,
                    ),
                  ),
                  SizedBox(width: 16),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          child: Text(
                            'Four Things Every Woman Needs To know',
                            style: themeData.textTheme.headline4,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Assets.img.stories.story1.image(
                                  fit: BoxFit.cover,
                                  width: 48,
                                  height: 48,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Emlia clarck',
                                      style: themeData.textTheme.bodyText1!
                                          .copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text('2min ago'),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showSnackBar(context, 'share btn clicked');
                                },
                                icon: Icon(
                                  CupertinoIcons.share,
                                  color: themeData.colorScheme.primary,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showSnackBar(context, 'bookmark btn clicked');
                                },
                                icon: Icon(
                                  CupertinoIcons.bookmark,
                                  color: themeData.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                          child: Assets.img.background.singlePost.image(),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                            style: themeData.textTheme.headline5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temporLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temporLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temporLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temporLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temporLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temporamet, consectetur adipiscing elit, sed do eiusmod temporLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temporLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                            style: themeData.textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
          // SliverPadding(padding: EdgeInsets.only(bottom: 220))
        ],
      ),
    );
  }
}
