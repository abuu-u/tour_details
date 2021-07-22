import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tour_details/models/tour_card_model.dart';
import 'package:tour_details/widgets/custom_list_tile.dart';

import 'blur_container.dart';

class TourCard extends StatelessWidget {
  const TourCard(this.tour, {Key? key}) : super(key: key);

  static const eventStyle = TextStyle(
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
    fontSize: 13,
    height: 1.3,
    color: Colors.white,
  );

  final TourCardModel tour;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      height: (deviceWidth - 32) * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(tour.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.75,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                    blendMode: BlendMode.src,
                    child: Container(
                      height:
                          4 + 4 + 13 * 1.3 * (tour.isRoad ? 1 : 2) + 18 * 1.2,
                      width: deviceWidth - 32 - 11 - 7,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 4,
                    left: 11,
                    right: 7,
                    top: 4,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tour.title,
                            style: const TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              height: 1.2,
                              color: Colors.white,
                            ),
                          ),
                          if (!tour.isRoad)
                            SvgPicture.asset(
                              'assets/icons/heart.svg',
                              width: 20,
                              height: 18.5,
                            ),
                        ],
                      ),
                      Text(
                        tour.event.name,
                        style: eventStyle,
                      ),
                      if (tour.event.availability != null)
                        Row(
                          children: [
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 175, 0, 1),
                                border: Border.all(color: Colors.white),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              tour.event.availability ?? '',
                              style: eventStyle,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!tour.isRoad) ...[
                CustomListTile(
                  icon: SvgPicture.asset('assets/icons/star.svg'),
                  text: Text(
                    tour.rating.toString(),
                    style: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      height: 1.2,
                    ),
                  ),
                ),
                CustomListTile(
                  icon: SvgPicture.asset('assets/icons/time.svg'),
                  text: Text(
                    '${tour.duration} min',
                    style: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      height: 1.25,
                    ),
                  ),
                ),
              ],
              BlurContainer(
                padding: const EdgeInsets.all(6),
                height: 26,
                child: Text(
                  '${tour.roadLength} km',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 1.25,
                    color: Colors.white,
                  ),
                ),
              ),
              if (tour.paid)
                const BlurContainer(
                  padding: EdgeInsets.all(3.5),
                  height: 26,
                  width: 26,
                  child: Text(
                    '€',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1.2,
                      color: Colors.white,
                    ),
                  ),
                )
              else
                const SizedBox(width: 26, height: 26),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromRGBO(255, 81, 52, 1),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: tour.open
                      ? SvgPicture.asset('assets/icons/play.svg')
                      : SvgPicture.asset('assets/icons/lock.svg'),
                  iconSize: tour.open ? 10 : 14,
                  padding: EdgeInsets.all(tour.open ? 8 : 6),
                  constraints: const BoxConstraints(
                    maxWidth: 26,
                    maxHeight: 26,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
