import 'package:flutter/material.dart';
import 'constants.dart';


class IconContent extends StatelessWidget {

  const IconContent({super.key, this.icon, this.label});

  final IconData? icon;
  final String? label;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: const Color(0xFFFFFFFF),
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(label!, style: kLabelTextStyle,
        ),
      ],
    );
  }
}