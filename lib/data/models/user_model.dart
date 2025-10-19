import '../../domain/entities/user_profile.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String pictureUrl;
  final int age;
  final String city;
  final String country;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.pictureUrl,
    required this.age,
    required this.city,
    required this.country,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['login']['uuid'] as String,
      firstName: json['name']['first'] as String,
      lastName: json['name']['last'] as String,
      pictureUrl: json['picture']['large'] as String,
      age: json['dob']['age'] as int,
      city: json['location']['city'] as String,
      country: json['location']['country'] as String,
    );
  }

  UserProfile toEntity() {
    return UserProfile(
      id: id,
      firstName: firstName,
      lastName: lastName,
      pictureUrl: pictureUrl,
      age: age,
      city: city,
      country: country,
    );
  }
}
