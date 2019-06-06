import 'package:json_annotation/json_annotation.dart';
part 'nytimes_model.g.dart';

@JsonSerializable()
class NyResponses{
  NyResponses();
  List<NyResponse> results;
  factory NyResponses.fromJson(Map<String, dynamic> json) => _$NyResponsesFromJson(json);


}
@JsonSerializable()
class NyResponse{
  String section;
  String subsection;
  String title;
  String abstract;
  String url;
  String byline;
  String item_type;
  String updated_date;
  String published_date;
  String material_type_facet;
  String kicker;
  List<String> des_facet;
  List<String> org_facet;
  List<String> per_facet;
  List<String> geo_facet;
  List<MultiMedia> multimedia;
  NyResponse(this.title);

  factory NyResponse.fromJson(Map<String, dynamic> json) => _$NyResponseFromJson(json);

}

@JsonSerializable()
class MultiMedia{
  String url;
  String format;
  int height;
  int width;
  String type;
  String subtype;
  String caption;
  String copyright;
  MultiMedia(this.format);

  factory MultiMedia.fromJson(Map<String, dynamic> json) =>_$MultiMediaFromJson(json);


}


