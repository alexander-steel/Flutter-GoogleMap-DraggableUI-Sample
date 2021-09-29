import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends HookWidget {
  final Completer<GoogleMapController> _googleMapController = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.3606237, 138.7098538),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(35.3606237, 138.7098538),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          myLocationButtonEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          markers: {
            Marker(
                markerId: MarkerId("1"),
                position: LatLng(35.3606237, 138.7098538))
          },
          onMapCreated: (GoogleMapController controller) {
            _googleMapController.complete(controller);
          },
        ),
        DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              color: Colors.white,
              child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Container(
                        margin: EdgeInsets.fromLTRB(150.0, 10, 150.0, 0),
                        padding: EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.deepOrangeAccent),
                      )),
                      Text("富士山"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "静岡県富士宮市北山",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "789546-5786785-543544",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 40,
                        width: 340,
                        margin: EdgeInsets.fromLTRB(10.0, 10, 20.0, 0),
                        padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.deepOrangeAccent),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "住所",
                        style: TextStyle(fontSize: 8),
                      ),
                      Text(
                        "静岡県富士宮市北山 xxx-xxxx-xxx",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )),
            );
          },
        ),
      ],
    ));
  }
}
