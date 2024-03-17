import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import '../../generated/assets.dart';

class QuoteWidget extends StatelessWidget {
  final String quote;
  final String author;
  final VoidCallback? onNextClick;

  const QuoteWidget(
      {super.key,
        required this.quote,
        required this.author,
        this.onNextClick,

      });

  @override
  Widget build(BuildContext context) {
    RandomColor randomColor = RandomColor();

    return SizedBox(
      width: double.infinity,
      height: 500,
      child: Card(
        color: randomColor.randomColor(
          colorHue: ColorHue.multiple(
            colorHues: [ColorHue.purple, ColorHue.green],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                Assets.assetsQuote,
                height: 30,
                width: 30,
                color: Colors.white,
              ),
              Text(
                quote,
                style: const TextStyle(
                  fontSize: 28,
                  fontFamily: 'vollkorn',
                  color: Colors.white,
                ),

              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                    author,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'vollkorn',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}