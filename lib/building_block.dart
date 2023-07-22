import 'package:flutter/material.dart';

class BuildingBlock extends StatelessWidget {
  const BuildingBlock({super.key,
    required this.rong, this.cardChild, this.onPress,
  });

  final Color rong;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: rong,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}