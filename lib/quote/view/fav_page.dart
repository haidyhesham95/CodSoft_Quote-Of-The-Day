import 'package:flutter/material.dart';
import 'package:quote_of_the_day/quote/widget/item_builder.dart';
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

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: quoteAppBar(context,'Favorite Quotes ', hasElevation: false),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        itemCount: widget.favorites.length,
        itemBuilder: (context, index) {
          return  itemBuilder(context, index, widget.favorites , onLongPress: () {
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
          },);
        },
      ),
    );
  }
}
