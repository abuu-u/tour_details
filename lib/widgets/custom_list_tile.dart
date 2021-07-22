import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final SvgPicture icon;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      height: 26,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 4),
          text,
        ],
      ),
    );
  }
}
