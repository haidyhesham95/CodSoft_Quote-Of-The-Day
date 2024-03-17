import 'package:flutter/material.dart';


AppBar quoteAppBar(BuildContext context,String title, {bool hasElevation = false,void Function()? onPressed}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(title),
    titleTextStyle: TextStyle(
      color: Colors.brown,
      fontFamily: 'vollkorn',
      fontSize: 23,
      fontWeight: FontWeight.w600,
    ),
    actions:[
      if (hasElevation)
      IconButton(
        onPressed: onPressed,

        icon: RotationTransition(
          turns: AlwaysStoppedAnimation(90 / 360),
            child: Icon(Icons.label, color: Colors.brown, size: 30)),
      ),
    ],
  );
}
