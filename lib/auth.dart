import 'package:blog_club7/constants.dart';
import 'package:blog_club7/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthSCreen extends StatefulWidget {
  const AuthSCreen({super.key});

  @override
  State<AuthSCreen> createState() => _AuthSCreenState();
}

class _AuthSCreenState extends State<AuthSCreen> {
  static const int loginTab = 0;
  static const int signupTab = 1;
  int selectedIndex = loginTab;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextStyle kTabTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: themeData.colorScheme.onPrimary,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // LOGO
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Assets.img.icons.logo.svg(width: 120),
            ),
            Expanded(
              //  blue container
              child: Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                // login /sign up text and white container
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                if (selectedIndex == signupTab) {
                                  selectedIndex = loginTab;
                                }
                                return;
                              });
                            },
                            child: Text(
                              'Login'.toUpperCase(),
                              style: kTabTextStyle.apply(
                                color: selectedIndex == loginTab
                                    ? themeData.colorScheme.onPrimary
                                    : Colors.white54,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                if (selectedIndex == loginTab) {
                                  selectedIndex = signupTab;
                                }
                                return;
                              });
                            },
                            child: Text(
                              'Sign up'.toUpperCase(),
                              style: kTabTextStyle.apply(
                                color: selectedIndex == signupTab
                                    ? themeData.colorScheme.onPrimary
                                    : Colors.white54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.surface,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: selectedIndex == loginTab
                                ? _Login(themeData: themeData)
                                : _SignUp(themeData: themeData),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcme back',
          style: themeData.textTheme.headline4,
        ),
        SizedBox(height: 8),
        Text(
          'Sign in with your account',
          style: themeData.textTheme.subtitle1!.apply(
            fontSizeFactor: .8,
          ),
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            label: Text('Username'),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        PasswordTextfield(),
        SizedBox(
          height: 24,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(
              MediaQuery.of(context).size.width,
              60,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {},
          child: Text('LOGIN'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Forget your password?'),
            SizedBox(width: 8),
            TextButton(
              onPressed: () {},
              child: Text('Reset here'),
            ),
          ],
        ),
        SizedBox(height: 16),
        Center(
          child: Text(
            'Or Sign in with'.toUpperCase(),
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        ),
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcme to blog club',
          style: themeData.textTheme.headline4,
        ),
        SizedBox(height: 8),
        Text(
          'please enter your information',
          style: themeData.textTheme.subtitle1!.apply(
            fontSizeFactor: .8,
          ),
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            label: Text('Fullname'),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            label: Text('Username'),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        PasswordTextfield(),
        SizedBox(
          height: 24,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(
              MediaQuery.of(context).size.width,
              60,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {},
          child: Text('Sign up'),
        ),
        SizedBox(height: 16),
        Center(
          child: Text(
            'Or Sign up with'.toUpperCase(),
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        ),
      ],
    );
  }
}

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        label: Text('Password'),
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Text(
            obscureText ? 'Show' : 'Hide',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
