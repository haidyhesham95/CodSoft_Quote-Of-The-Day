import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

import '../widget/app_bar.dart';

class FavPage extends StatefulWidget {
  final List<dynamic> favorites;

 const FavPage({Key? key, required this.favorites}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    RandomColor randomColor = RandomColor();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: quoteAppBar(context,'Favorite Quotes ', hasElevation: false),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        itemCount: widget.favorites.length,
        itemBuilder: (context, index) {
          final quote = widget.favorites[index]; // Access the current quote
          return  Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 12),

            child: InkWell(
              onLongPress: () {
                widget.favorites.removeAt(index);
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.brown,
                    content: Text('Quote removed from favorites',
                        style: TextStyle(color: Colors.white,fontSize: 20)),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Card(
                color: randomColor.randomColor(
                  colorHue: ColorHue.multiple(
                    colorHues: [ColorHue.purple, ColorHue.blue],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
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
                    ),
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
            ),
          );
        },
      ),
    );
  }
}
