import 'package:floodguard_ai/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../services/flood_data_service.dart';

class FloodMapPage extends StatefulWidget {
  const FloodMapPage({super.key});

  @override
  State<FloodMapPage> createState() => _FloodMapPageState();
}

class _FloodMapPageState extends State<FloodMapPage> {
  late GoogleMapController mapController;

  final FloodDataService _service = FloodDataService();
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    loadMarkers();
  }

  Future<void> loadMarkers() async {
    final data = await _service.getFloodHistory();

    setState(() {
      markers = data.map((record) {
        return Marker(
          markerId: MarkerId(record.location + record.date.toString()),
          position: LatLng(record.lat, record.lng),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            record.flooded ? BitmapDescriptor.hueRed : BitmapDescriptor.hueGreen,
          ),
          infoWindow: InfoWindow(
            title: record.location,
            snippet: record.flooded ? "Flooded • ${record.date.year}" : "No Flood",
          ),
        );
      }).toSet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Flood Risk Map", actions: []),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(target: LatLng(3.1390, 101.6869), zoom: 10),
        markers: markers,
        mapType: MapType.normal,
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
      ),
    );
  }
}
