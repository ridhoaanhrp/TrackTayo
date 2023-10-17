import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:track_tayo/osm_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class OpenStreetMap extends StatelessWidget {
  OpenStreetMap({super.key});

  final mapController = MapController();

  final OsmController osmController = Get.put(OsmController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
                keepAlive: true,
                zoom: 16,
                center: LatLng(-6.9732, 107.6313),
                maxZoom: 19),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              GetX<OsmController>(
                init: OsmController(),
                builder: (controller) => MarkerLayer(
                  markers: controller.allMarker.value,
                ),
              ),
              GetX<OsmController>(
                init: OsmController(),
                builder: (controller) => MarkerLayer(
                  markers: controller.halteMarker.value,
                ),
              ),
              CurrentLocationLayer(
                centerOnLocationUpdate: CenterOnLocationUpdate.always,
                turnOnHeadingUpdate: TurnOnHeadingUpdate.never,
                positionStream:
                    LocationMarkerDataStreamFactory().geolocatorPositionStream(
                        stream: Geolocator.getPositionStream(
                            locationSettings: const LocationSettings(
                  accuracy: LocationAccuracy.high,
                  distanceFilter: 50,
                ))),
              )
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Image.asset(
              "images/logo.png",
              width: 256,
            ),
          ]),
        ]),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   osmController.getUserLocation(userLocation!);
      // }),
    );
  }
}
