import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tour_details/models/tour_card_model.dart';
import 'package:tour_details/widgets/collapsable_text.dart';
import 'package:tour_details/widgets/header.dart';
import 'package:tour_details/widgets/tour_card.dart';

class TourDetails extends StatefulWidget {
  const TourDetails({Key? key}) : super(key: key);

  @override
  _TourDetailsState createState() => _TourDetailsState();
}

class _TourDetailsState extends State<TourDetails> {
  static const _titleStyle = TextStyle(
    color: Color.fromRGBO(30, 40, 67, 1),
    fontWeight: FontWeight.w700,
    fontFamily: 'Gilroy',
    fontSize: 24,
    height: 1.2,
  );

  static const _bodyStyle = TextStyle(
    color: Color.fromRGBO(30, 40, 67, 1),
    fontWeight: FontWeight.w500,
    fontFamily: 'Gilroy',
    fontSize: 16,
    height: 1.375,
  );

  final tours = [
    const TourCardModel(
      image: 'assets/images/timanfaya.jpg',
      title: 'Park Timanfaya',
      event: Event(
        name: 'Volcano',
        availability: 'Open daylong',
      ),
      roadLength: 22.2,
      rating: 4.5,
      duration: 40,
      paid: true,
      open: true,
    ),
    const TourCardModel(
      image: 'assets/images/timanfaya-road.jpg',
      title: 'Road to Timanfaya',
      event: Event(
        name: 'Eruption history',
      ),
      roadLength: 22.2,
      isRoad: true,
    ),
    const TourCardModel(
      image: 'assets/images/gardin.jpg',
      title: 'Gardin de Cactus',
      event: Event(
        name: 'Cactus Garden',
        availability: 'Open until 5:30 p.m.',
      ),
      roadLength: 22.2,
      rating: 4.5,
      duration: 40,
    ),
    const TourCardModel(
      image: 'assets/images/timanfaya.jpg',
      title: 'Park Timanfaya',
      event: Event(
        name: 'Volcano',
        availability: 'Open daylong',
      ),
      roadLength: 22.2,
      rating: 4.5,
      duration: 40,
      paid: true,
    ),
    const TourCardModel(
      image: 'assets/images/timanfaya-2.jpg',
      title: 'Park Timanfaya',
      event: Event(
        name: 'Volcano',
        availability: 'Open daylong',
      ),
      roadLength: 22.2,
      rating: 4.5,
      duration: 40,
      paid: true,
    ),
    const TourCardModel(
      image: 'assets/images/timanfaya-road-2.jpg',
      title: 'Road to Timanfaya',
      event: Event(
        name: 'Eruption history',
      ),
      roadLength: 22.2,
      isRoad: true,
    ),
    const TourCardModel(
      image: 'assets/images/cueva.jpg',
      title: 'Cueva de los Verdes',
      event: Event(
        name: 'Cactus Garden',
        availability: 'Open until 5:30 p.m.',
      ),
      roadLength: 22.2,
      rating: 4.5,
      duration: 40,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            ListView(
              children: [
                const Header(),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Grand Tour',
                        style: _titleStyle,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Excursion on the island of Lanzarote. North and South.',
                                  style: _bodyStyle,
                                ),
                                const SizedBox(height: 9),
                                Text(
                                  'Duration 4-9 hours',
                                  style: _bodyStyle.copyWith(
                                      fontStyle: FontStyle.italic),
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                          SvgPicture.asset('assets/images/map.svg'),
                        ],
                      ),
                      const CollapsableText(
                        'A sightseeing tour of Lanzarote will introduce you to its beauties, history, culture and traditions.  Your route will make its way through the entirer entirer entirer entirer entirer entirer entirer entirer entirer entirer entirer entirer entirer entirer entirer entirer',
                        maxLines: 4,
                        style: _bodyStyle,
                        // width: deviceWidth - 32,
                      ),
                      const SizedBox(height: 30),
                      ...tours.map(
                        (tour) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TourCard(tour),
                          );
                        },
                      ).toList(),
                    ],
                  ),
                ),
                const SizedBox(height: 53),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 58,
                width: deviceWidth,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0),
                    Color.fromRGBO(255, 255, 255, 1),
                  ],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                )),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 16,
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                    backgroundColor: const Color.fromRGBO(10, 175, 126, 1),
                  ),
                  child: const Text(
                    'Buy',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      height: 1.2,
                      color: Colors.white,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
