import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CollapsableText extends StatefulWidget {
  const CollapsableText(
    this.text, {
    Key? key,
    required this.maxLines,
    required this.style,
    // required this.width,
  }) : super(key: key);

  final String text;
  final TextStyle style;
  final int maxLines;
  // final double width;

  @override
  _CollapsableTextState createState() => _CollapsableTextState();
}

class _CollapsableTextState extends State<CollapsableText> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        clipBehavior: Clip.none,
        children: [
          Text(
            widget.text,
            style: widget.style,
            textAlign: TextAlign.left,
            maxLines: open ? null : widget.maxLines,
          ),
          if (!open)
            Positioned(
              bottom: -2,
              right: 0,
              child: Container(
                width: constraints.maxWidth,
                height: 25,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 1),
                      Color.fromRGBO(255, 255, 255, 0),
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
              ),
            ),
          const SizedBox(width: 9),
          Positioned(
            bottom: -2,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: RotatedBox(
                quarterTurns: open ? 2 : 0,
                child: IconButton(
                  onPressed: () => setState(() => open = !open),
                  icon: SvgPicture.asset('assets/icons/arrow-down.svg'),
                  iconSize: 12,
                  padding: const EdgeInsets.all(6),
                  constraints: const BoxConstraints(
                    maxWidth: 24,
                    maxHeight: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
