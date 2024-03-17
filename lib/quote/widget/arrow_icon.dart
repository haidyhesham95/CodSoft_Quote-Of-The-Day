import 'package:flutter/material.dart';

class ArrowIcon extends StatelessWidget {
  const ArrowIcon({super.key, this.onPressed, this.icon});

  final void Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.all(10),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
