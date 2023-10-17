import 'package:get/get.dart';
import 'package:track_tayo/osm_controller.dart';
import 'package:track_tayo/track_repository.dart';

class OsmBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(<OsmController>{OsmController()});
    Get.put(<TrackRepository>{TrackRepository()});
  }
}
