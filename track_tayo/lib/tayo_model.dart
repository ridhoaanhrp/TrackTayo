class TayoModel {
  TayoModel({
    required this.id,
    required this.attributes,
    required this.deviceId,
    required this.protocol,
    required this.serverTime,
    required this.deviceTime,
    required this.fixTime,
    required this.outdated,
    required this.valid,
    required this.latitude,
    required this.longitude,
    required this.altitude,
    required this.speed,
    required this.course,
    required this.address,
    required this.accuracy,
    required this.network,
  });

  int id;
  Attributes attributes;
  int deviceId;
  String protocol;
  DateTime serverTime;
  DateTime deviceTime;
  DateTime fixTime;
  bool outdated;
  bool valid;
  double latitude;
  double longitude;
  double altitude;
  double speed;
  double course;
  dynamic address;
  double accuracy;
  dynamic network;

  factory TayoModel.fromJson(Map<String, dynamic> json) => TayoModel(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
        deviceId: json["deviceId"],
        protocol: json["protocol"],
        serverTime: DateTime.parse(json["serverTime"]),
        deviceTime: DateTime.parse(json["deviceTime"]),
        fixTime: DateTime.parse(json["fixTime"]),
        outdated: json["outdated"],
        valid: json["valid"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        altitude: json["altitude"].toDouble(),
        speed: json["speed"].toDouble(),
        course: json["course"].toDouble(),
        address: json["address"],
        accuracy: json["accuracy"].toDouble(),
        network: json["network"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
        "deviceId": deviceId,
        "protocol": protocol,
        "serverTime": serverTime.toIso8601String(),
        "deviceTime": deviceTime.toIso8601String(),
        "fixTime": fixTime.toIso8601String(),
        "outdated": outdated,
        "valid": valid,
        "latitude": latitude,
        "longitude": longitude,
        "altitude": altitude,
        "speed": speed,
        "course": course,
        "address": address,
        "accuracy": accuracy,
        "network": network,
      };
}

class Attributes {
  Attributes({
    required this.batteryLevel,
    required this.distance,
    required this.totalDistance,
    required this.motion,
    required this.charge,
  });

  dynamic batteryLevel;
  double distance;
  double totalDistance;
  bool motion;
  bool? charge;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        batteryLevel: json["batteryLevel"],
        distance: json["distance"].toDouble(),
        totalDistance: json["totalDistance"].toDouble(),
        motion: json["motion"],
        charge: json["charge"] == null ? null : json["charge"],
      );

  Map<String, dynamic> toJson() => {
        "batteryLevel": batteryLevel,
        "distance": distance,
        "totalDistance": totalDistance,
        "motion": motion,
        "charge": charge == null ? null : charge,
      };
}
