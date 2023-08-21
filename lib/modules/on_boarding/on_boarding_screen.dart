import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/on_bording.dart';
import '../../shared/components/components.dart';
import '../test_application/test_application_screen.dart';



class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

SharedPreferences sharedPreferences;

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        sharedPreferences = prefs;
      });
    });
  }

  void _completeOnboarding() {
    sharedPreferences.setBool('onboardingCompleted', true);
    navigateAndFinish(context, TestApplicationScreen(),);
  }

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onboarding1.jpg',
      title: 'On Board 1 Title',
      body: 'On Board 1 body',
    ),
    BoardingModel(
      image: 'assets/images/onboarding1.jpg',
      title: 'On Board 2 Title',
      body: 'On Board 2 body',
    ),
    BoardingModel(
      image: 'assets/images/onboarding1.jpg',
      title: 'On Board 3 Title',
      body: 'On Board 3 body',
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            defaultTextButton(
              text: 'skip',
              function: (){
                _completeOnboarding();
              },),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: boardController,
                  onPageChanged: (int index){
                    if(index == boarding.length - 1){
                      setState(() {
                        isLast = true;
                      });
                    }else{
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) =>
                      buildOnBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.blue,
                      dotHeight: 10.0,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5.0,
                    ),
                    count: boarding.length,
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if(isLast){
                        _completeOnboarding();
                      }else{
                        boardController.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }


}
