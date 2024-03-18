import 'package:flutter/material.dart';

class IconFav extends StatelessWidget {
  const IconFav({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 5, right: 10,top: 10,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.rotate(
            angle: 180 * 3.14 / 180,
            child: const Icon(
              Icons.format_quote,
              size: 30,
              color: Colors.white,
            ),
          ),
          const Icon(
            Icons.favorite,
            size: 30,
            color: Colors.brown,
          )
        ],
      ),
    );
  }
}
