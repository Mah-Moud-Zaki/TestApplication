import 'package:flutter/material.dart';

import '../../models/on_bording.dart';

Widget defaultTextButton({
  @required String text,
  @required Function function,
}) => TextButton(
  onPressed: function,
  child: Text(text.toUpperCase()),);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => widget),
      (route) => false,
);

void navigateTo(context, widget) => Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => widget),
);

Widget buildOnBoardingItem(BoardingModel model) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(child: Image(image: AssetImage('${model.image}'))),
    SizedBox(
      height: 20.0,
    ),
    Text(
      '${model.title}',
      style: TextStyle(
        fontSize: 24.0,
      ),
    ),
    SizedBox(
      height: 15.0,
    ),
    Text(
      '${model.body}',
      style: TextStyle(
        fontSize: 14.0,
      ),
    ),
    SizedBox(
      height: 15.0,
    ),
  ],
);

