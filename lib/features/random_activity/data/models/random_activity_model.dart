import 'package:random_activities/features/random_activity/domain/entities/random_activity.dart';

class RandomActivityModel extends RandomActivity {
  const RandomActivityModel({
    required String activity,
    required String type,
    required int participants,
    required double price,
    required String link,
    String? key,
    required double accessibility,
  }) : super(
          activity: activity,
          type: type,
          participants: participants,
          price: price,
          link: link,
          key: key,
          accessibility: accessibility,
        );
  factory RandomActivityModel.fromJson(Map<String, dynamic> json) {
    return RandomActivityModel(
        activity: json['activity'],
        type: json['type'],
        participants: json['participants'],
        price: json['price'],
        link: json['link'],
        accessibility: json['accessibility']);
  }

  Map<String, dynamic> toJson() {
    return {
      'activity': activity,
      'type': type,
      'participants': participants,
      'price': price,
      'link': link,
      'accessibility': accessibility,
    };
  }
}
