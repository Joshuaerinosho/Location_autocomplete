import 'package:flutter/material.dart';
import 'package:flutter_ioc_container/flutter_ioc_container.dart';
import 'package:google_places_api_sample/services/google_place_service.dart';
import 'notifiers/place_notifier.dart';
import 'view/constants.dart';
import 'package:google_places_api_sample/view/search_screen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Places',
      theme: ThemeData(
        primarySwatch: primarySwatchColor,
      ),
      home: CompositionRoot(
        compose: (builder) => builder
          ..addSingleton(
            (container) => PlacesNotifier(container<PlaceService>()),
          )
          ..addSingletonService(
            PlaceService(),
          ),
        child: const SearchScreen(),
      ),
    );
  }
}
