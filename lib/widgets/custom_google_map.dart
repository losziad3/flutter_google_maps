import 'package:flutter/material.dart';
import 'package:flutter_google_maps/models/place_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController googleMapController;
  Set<Marker> markers={};
  String? mapStyle;


  @override
  void initState() {
    super.initState();
    initMarkers();
    initialCameraPosition = const CameraPosition(
      zoom: 10,
      target: LatLng(30.007776806261962, 31.42619035342079),
    );
    loadMapStyle(); // Load the style on init
  }

  Future<void> loadMapStyle() async {
    mapStyle = await DefaultAssetBundle.of(context).loadString('assets/map_styles/google_map_night_style.json');
    setState(() {});
  }

  void initMarkers(){
   var myMarker = places.map((placeModel)=>Marker(
     infoWindow: InfoWindow(title: placeModel.name),
        position: placeModel.latLng,
        markerId: MarkerId(placeModel.id.toString()))).toSet();
   markers.addAll(myMarker);
  }
  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          zoomControlsEnabled: false,
          markers: markers,
          onMapCreated: (controller) {
            googleMapController = controller;
          },
          initialCameraPosition: initialCameraPosition,
          style: mapStyle,
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: ElevatedButton(
            onPressed: () {
              CameraPosition newLocation = const CameraPosition(
                target: LatLng(29.95935442539678, 30.923946973445624),
                zoom: 15,
              );
              googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(newLocation),
              );
            },
            child: const Text('Change Location'),
          ),
        ),
      ],
    );
  }
}
