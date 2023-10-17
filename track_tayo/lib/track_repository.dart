import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:track_tayo/tayo_model.dart';

class TrackRepository {
  List<TayoModel> locationList = [];

  Future<List<TayoModel>> getLocationList() async {
    locationList.clear();
    String token =
        'SDBGAiEAq-AeU2bIQIuAn3Pf0WPxdWjGHVS50OemSqZ8QnZivKkCIQCwxlCQN78XPAHYmGMz7Mk8CN4h995KSbP_IhKJZV7wpnsidSI6MSwiZSI6IjIwMjItMTEtMzBUMTc6MDA6MDAuMDAwKzAwOjAwIn0';
    Map<String, dynamic> body = {};
    var response =
        await http.post(Uri.parse("http://103.233.100.67:80/MyTucTuc/"),
            headers: {
              'Accept': 'application/json',
              'Content-type': 'application/json',
              HttpHeaders.authorizationHeader: token
              // 'Authorization': 'Bearer $token'
            },
            body: jsonEncode(body));

    if (response.statusCode == 200) {
      var locationData = jsonDecode(response.body);

      for (Map<String, dynamic> item in locationData) {
        TayoModel tayoModel = TayoModel.fromJson(item);
        locationList.add(tayoModel);
      }
      print(locationData);
      return locationList;
    } else {
      return [];
    }
  }
}
