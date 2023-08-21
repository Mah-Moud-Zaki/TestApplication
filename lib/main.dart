import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/on_boarding/on_boarding_screen.dart';
import 'modules/splash/splash_screen.dart';
import 'modules/test_application/test_application_screen.dart';

SharedPreferences sharedPreferences;
void main() async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context,
            AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            sharedPreferences = snapshot.data;


            bool onboardingCompleted =
            sharedPreferences.getBool('onboardingCompleted');


            if (onboardingCompleted != null && onboardingCompleted) {
              return TestApplicationScreen();
            } else {
              return OnBoardingScreen();
            }
          } else {
            return SplashScreen();
          }
        },
      ),
    );
  }
}


