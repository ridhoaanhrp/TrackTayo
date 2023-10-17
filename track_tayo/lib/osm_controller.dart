import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:track_tayo/track_repository.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get_rx/get_rx.dart';

class OsmController extends GetxController {
  final TrackRepository repository = Get.put(TrackRepository());
  // static OsmController instance = Get.find();
  var allMarker = <Marker>[].obs;
  Timer? timer;
  var halteMarker = <Marker>[].obs;
  List<Map<String, dynamic>> halteList = [
    {
      "name": "Shelter TUC #1",
      "location": "Gedung K",
      "latitude": -6.9753346,
      "longitude": 107.6301793
    },
    {
      "name": "Shelter TUC #2",
      "location": "Gedung TULT",
      "latitude": -6.9692375,
      "longitude": 107.6280469
    },
    {
      "name": "Shelter TUC #3",
      "location": "Parkir Motor Alor",
      "latitude": -6.9713375,
      "longitude": 107.6305781
    }
  ];
  // Position? position;
  // var serviceEnabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    // getLocation();
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      return getLocation();
    });
    getHalte();
    // getUserLocation();
  }

  void getLocation() async {
    var markers = await repository.getLocationList();
    allMarker.clear();
    allMarker.addAll(markers.map((e) => Marker(
        point: LatLng(e.latitude, e.longitude),
        builder: (context) => Image.asset("images/tayo-fix.png"))));
  }

  void getHalte() {
    halteList.forEach((element) {
      halteMarker.add(Marker(
          point: LatLng(element['latitude'], element['longitude']),
          builder: (context) => Image.asset("images/stop.png")));
    });
  }

  // getUserLocation() async {
  //   // bool serviceEnabled = false;
  //   PermissionStatus? permissionGranted;

  //   Location location = Location();

  //   serviceEnabled.value = await location.serviceEnabled();
  //   if (!serviceEnabled.value) {
  //     serviceEnabled.value = await location.requestService();
  //     if (!serviceEnabled.value) {
  //       return null;
  //     }
  //   }

  //   permissionGranted = await location.hasPermission();
  //   if (permissionGranted == PermissionStatus.denied) {
  //     permissionGranted = await location.requestPermission();
  //     if (permissionGranted != PermissionStatus.granted) {
  //       return null;
  //     }
  //   }

  //   return await location.getLocation();
  // }
}
