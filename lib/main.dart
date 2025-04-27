import 'package:flutter/material.dart';
import 'package:flutter_google_maps/widgets/custom_google_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomGoogleMap(),
    );
  }
}

/*
ZOOM VIEW
World view 0--->3
Country 4----> 6
City 10----->12
Street 13---->17
Building 18 ---->20
 */