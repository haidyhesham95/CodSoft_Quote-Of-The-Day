import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, this.onPressed, this.icon});
 final void Function()? onPressed;
 final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
          Border.all(width: 2, color: Colors.brown)),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
         icon,
          size: 25,
          color: Colors.brown,
        ),
      ),
    );
  }
}
