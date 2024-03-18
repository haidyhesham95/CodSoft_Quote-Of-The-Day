import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

import 'icon_fav.dart';


  Widget itemBuilder(BuildContext context ,int index, List<dynamic> favorites , {void Function()? onLongPress}) {
    RandomColor randomColor = RandomColor();
    final quote = favorites[index];


    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onLongPress: onLongPress,
        child: Card(
          color: randomColor.randomColor(
            colorHue: ColorHue.multiple(
              colorHues: [ColorHue.purple, ColorHue.blue],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconFav(),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  quote["text"].toString(), // Access text of the current quote
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: 'vollkorn',
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(right: 10,bottom: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    quote["author"].toString(), // Access author of the current quote
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'vollkorn',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )) ;
  }

