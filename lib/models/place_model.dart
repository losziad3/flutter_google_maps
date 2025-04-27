import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel{
  final int id;
  final String name;
  final LatLng latLng;

  PlaceModel({required this.id, required this.name, required this.latLng});

}
List<PlaceModel> places = [
  PlaceModel(id: 1, name: 'Mazghouna Market', latLng: LatLng(29.75069955853331, 31.26177655241914),),
  PlaceModel(id: 2, name: 'Kornesh El-Menya', latLng: LatLng(29.745408670702464, 31.297653777616247),),
  PlaceModel(id: 3, name: 'Azzam Mosque', latLng: LatLng(29.78512076794383, 31.280830964425718),),
];