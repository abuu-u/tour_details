class TourCardModel {
  final bool isRoad;
  final bool open;
  final bool paid;
  final String image;
  final String title;
  final Event event;
  final double? rating;
  final int? duration;
  final double roadLength;

  const TourCardModel({
    required this.image,
    required this.title,
    required this.event,
    required this.roadLength,
    this.paid = false,
    this.open = false,
    this.isRoad = false,
    this.rating,
    this.duration,
  });
}

class Event {
  final String name;
  final String? availability;

  const Event({
    required this.name,
    this.availability,
  });
}
