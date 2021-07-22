import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'blur_container.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  var _curIndex = 0;

  static const _images = [
    Image(
      image: AssetImage('assets/images/img.jpg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/images/img.jpg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/images/img.jpg'),
      fit: BoxFit.cover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    final deviceWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: deviceWidth * 0.6,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                setState(() => _curIndex = index);
                if (index == 0) {
                  setState(() => _curIndex = _images.length);
                  controller.jumpToPage(_curIndex);
                }
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    SizedBox.expand(child: _images[index % _images.length]),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: deviceWidth,
                        height: deviceWidth * 0.2,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(0, 0, 0, 0.5),
                                Color.fromRGBO(0, 0, 0, 0.2085),
                                Color.fromRGBO(0, 0, 0, 0),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: deviceWidth,
                        height: deviceWidth * 0.20625,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(0, 0, 0, 0),
                                Color.fromRGBO(0, 0, 0, 0.1251),
                                Color.fromRGBO(0, 0, 0, 0.3),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 10,
              child: Row(
                children: _images.map((img) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.5,
                    ),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: img == _images[_curIndex % _images.length]
                            ? Colors.white
                            : null,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 16,
              child: BlurContainer(
                padding: const EdgeInsets.all(6),
                height: 32,
                width: 32,
                child: SvgPicture.asset(
                  'assets/icons/lock.svg',
                ),
              ),
            ),
            Positioned(
              top: 23,
              left: 0,
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/arrow-back.svg',
                ),
                iconSize: 14,
                onPressed: () => {},
                constraints: const BoxConstraints(maxWidth: 38, maxHeight: 38),
                padding: const EdgeInsets.all(9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
