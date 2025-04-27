import 'package:flutter/material.dart';
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
  String? mapStyle; // <-- Add a field to hold the style

  @override
  void initState() {
    super.initState();
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
                zoom: 12,
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
