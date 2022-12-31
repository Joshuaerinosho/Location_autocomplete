import 'package:flutter/material.dart';
import '../models/places_models.dart';
import '../services/google_place_service.dart';

const apiKey = "YOUR_GOOGLE_PLACES_API_KEY";

class PlacesNotifier extends ChangeNotifier {
  PlacesNotifier(this._placeService);

  final PlaceService _placeService;

  String _selectedLocation = '';

  List<PlacePredictions> _places = [];
  TextEditingController _selectCityController = TextEditingController();

  String get selectedLocation => _selectedLocation;

  List<PlacePredictions> get places => _places;
  TextEditingController get selectCityController => _selectCityController;

  Future<void> setLocation(String location) async {
    _selectedLocation = location;
    _selectCityController.text = location;
    _places = [];
    notifyListeners();
  }

  Future<void> getPlaces(String query) async {
    Uri uri = Uri.https(
      "maps.googleapis.com",
      "/maps/api/place/autocomplete/json",
      {"input": query, "key": apiKey},
    );

    String? response = await _placeService.getUrl(uri);
    if (response != null) {
      PlacesResponse placesPredictions =
          PlacesResponse.parsePlacesResponse(response);
      if (placesPredictions.predictions != null) {
        _places = placesPredictions.predictions!;
      }
    }
    notifyListeners();
  }
}
