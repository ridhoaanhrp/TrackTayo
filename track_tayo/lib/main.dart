import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:track_tayo/osm.dart';
import 'package:track_tayo/osm_binding.dart';

void main() {
  OsmBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: OsmBinding(),
      title: 'Tracking Tayo',
      home: OpenStreetMap(),
    );
  }
}
