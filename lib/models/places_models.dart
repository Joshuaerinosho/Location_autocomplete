import 'dart:convert';

class PlacesResponse {
  final String? status;
  final List<PlacePredictions>? predictions;

  PlacesResponse({
    this.status,
    this.predictions,
  });

  factory PlacesResponse.fromJson(Map<String, dynamic> json) => PlacesResponse(
      status: json["status"] as String,
      predictions: json["predictions"] != null
          ? json["predictions"]
              .map<PlacePredictions>((json) => PlacePredictions.fromJson(json))
              .toList()
          : null);

  static PlacesResponse parsePlacesResponse(String responseBody) {
    final parsedData = json.decode(responseBody).cast<String, dynamic>();
    return PlacesResponse.fromJson(parsedData);
  }
}

class PlacePredictions {
  final String? description;
  final StructuredFormatting? structuredFormatting;
  final String? placeId;
  final String? reference;

  PlacePredictions({
    this.description,
    this.structuredFormatting,
    this.placeId,
    this.reference,
  });

  factory PlacePredictions.fromJson(Map<String, dynamic> json) =>
      PlacePredictions(
        description: json["description"] ?? '',
        placeId: json["place_id"] ?? '',
        reference: json["reference"] ?? '',
        structuredFormatting: json["structured_formatting"] != null
            ? StructuredFormatting.fromJson(
                json["structured_formatting"],
              )
            : null,
      );
}

class StructuredFormatting {
  final String? mainText;
  final String? subText;

  StructuredFormatting({this.mainText, this.subText});

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) =>
      StructuredFormatting(
        mainText: json["main_text"] ?? '',
        subText: json["secondary_text"] ?? '',
      );
}
