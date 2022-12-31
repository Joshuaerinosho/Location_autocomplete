import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_api_sample/view/utils.dart';
import 'package:flutter_ioc_container/flutter_ioc_container.dart';
import '../notifiers/place_notifier.dart';
import 'constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(context) {
    final size = MediaQuery.of(context).size;
    final placeNotifier = context<PlacesNotifier>();

    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Where do you\nwant to go?',
                  style: GoogleFonts.outfit(
                    fontSize: 32,
                    color: const Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  height: size.height * 0.60, //60% of screen height
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4A6865),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: defaultWhite,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: placeNotifier.selectCityController,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              fillColor: defaultWhite,
                              focusColor: defaultWhite,
                              focusedBorder: activeBorder,
                              enabledBorder: defaultBorder,
                              border: defaultBorder,
                              hintText: 'Search...',
                              contentPadding: const EdgeInsets.only(left: 15),
                              hintStyle: GoogleFonts.outfit(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color(0xFF6A7486),
                              ),
                            ),
                            onChanged: (value) {
                              placeNotifier.getPlaces(value);
                              setState(() {});
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            placeNotifier.places.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: InkWell(
                                onTap: () => placeNotifier
                                    .setLocation(placeNotifier.places[index]
                                        .structuredFormatting!.mainText!)
                                    .then((value) {
                                  context.dismissKeyboard(context);
                                }),
                                child: Container(
                                  width: size.width,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: defaultWhite,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    placeNotifier.places[index].description ??
                                        '',
                                    style: GoogleFonts.outfit(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: const Color(0xFF1C1B4E),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
