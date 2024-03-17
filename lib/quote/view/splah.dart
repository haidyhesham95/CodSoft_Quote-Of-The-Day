import 'package:flutter/material.dart';
import 'package:quote_of_the_day/quote/view/quote_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import '../../generated/assets.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SplashScreenView(
        navigateRoute: const QuotePage(),
        duration: 5000,
        imageSize:300,
        text: "Quote of the Day",
        textStyle: const TextStyle(
          fontFamily: 'vollkorn',
          fontSize: 30.0,
          color: Colors.brown,
          fontWeight: FontWeight.w600,
        ),
         imageSrc: Assets.assetsSplash,
        backgroundColor: Colors.black,

      ),
    );
  }
}
