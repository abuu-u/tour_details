import 'dart:ui';

import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  const BlurContainer({
    Key? key,
    required this.child,
    required this.padding,
    this.width,
    required this.height,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(8.0),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
        child: Container(
          alignment: Alignment.center,
          padding: padding,
          width: width,
          height: height,
          color: const Color.fromRGBO(0, 0, 0, 0.08),
          child: child,
        ),
      ),
    );
  }
}
