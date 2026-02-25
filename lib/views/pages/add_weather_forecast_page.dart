import 'package:floodguard_ai/services/weather_forecasts_service.dart';
import 'package:flutter/material.dart';
import 'package:country_state_city/country_state_city.dart' as csc;

class AddWeatherForecastPage extends StatefulWidget {
  const AddWeatherForecastPage({super.key});

  @override
  State<AddWeatherForecastPage> createState() => _AddWeatherForecastPageState();
}

class _AddWeatherForecastPageState extends State<AddWeatherForecastPage> {
  String? selectedState;
  String? selectedStateIso;
  String? selectedCity;
  List<csc.State> states = [];
  List<csc.City> cities = [];

  void _onAddClicked() async {
    await addWeatherForecast(selectedCity!);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _loadStates();
  }

  void _loadStates() async {
    final allStates = await getAllStates();

    setState(() {
      states = allStates;
    });
  }

  void _loadCities() async {
    setState(() {
      cities = [];
      selectedCity = null;
    });

    final allCities = await getAllCitiesByState(selectedStateIso!);

    setState(() {
      cities = allCities;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Weather Forecast", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // state select label
            Text("Choose a state", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            SizedBox(height: 10),

            // dropdown for all states in Malaysia
            states.isNotEmpty
                ? DropdownButtonFormField<String>(
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                    initialValue: selectedStateIso,
                    items: states.map((state) {
                      return DropdownMenuItem(value: state.isoCode, child: Text(state.name));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedState = value!;
                        selectedStateIso = value;
                      });

                      _loadCities();
                    },
                  )
                : CircularProgressIndicator(),

            SizedBox(height: 30),

            // city select label
            Text("Choose a city", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            SizedBox(height: 10),

            // dropdown for all cities in chosen state in Malaysia
            if (selectedStateIso != null)
              cities.isNotEmpty
                  ? DropdownButtonFormField<String>(
                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                      initialValue: selectedCity,
                      items: cities.map((city) {
                        return DropdownMenuItem(value: city.name, child: Text(city.name));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value!;
                        });
                      },
                    )
                  : CircularProgressIndicator()
            else
              Text('Please select a state first', style: TextStyle(fontSize: 18)),

            SizedBox(height: 30),

            // add button
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: _onAddClicked,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(1000, 50),
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                ),
                child: Text("Add", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
