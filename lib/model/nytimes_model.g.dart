// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nytimes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NyResponses _$NyResponsesFromJson(Map<String, dynamic> json) {
  return NyResponses()
    ..results = (json['results'] as List)
        ?.map((e) =>
            e == null ? null : NyResponse.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$NyResponsesToJson(NyResponses instance) =>
    <String, dynamic>{'results': instance.results};

NyResponse _$NyResponseFromJson(Map<String, dynamic> json) {
  return NyResponse(json['title'] as String)
    ..section = json['section'] as String
    ..subsection = json['subsection'] as String
    ..abstract = json['abstract'] as String
    ..url = json['url'] as String
    ..byline = json['byline'] as String
    ..item_type = json['item_type'] as String
    ..updated_date = json['updated_date'] as String
    ..published_date = json['published_date'] as String
    ..material_type_facet = json['material_type_facet'] as String
    ..kicker = json['kicker'] as String
    ..des_facet = (json['des_facet'] as List)?.map((e) => e as String)?.toList()
    ..org_facet = (json['org_facet'] as List)?.map((e) => e as String)?.toList()
    ..per_facet = (json['per_facet'] as List)?.map((e) => e as String)?.toList()
    ..geo_facet = (json['geo_facet'] as List)?.map((e) => e as String)?.toList()
    ..multimedia = (json['multimedia'] as List)
        ?.map((e) =>
            e == null ? null : MultiMedia.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$NyResponseToJson(NyResponse instance) =>
    <String, dynamic>{
      'section': instance.section,
      'subsection': instance.subsection,
      'title': instance.title,
      'abstract': instance.abstract,
      'url': instance.url,
      'byline': instance.byline,
      'item_type': instance.item_type,
      'updated_date': instance.updated_date,
      'published_date': instance.published_date,
      'material_type_facet': instance.material_type_facet,
      'kicker': instance.kicker,
      'des_facet': instance.des_facet,
      'org_facet': instance.org_facet,
      'per_facet': instance.per_facet,
      'geo_facet': instance.geo_facet,
      'multimedia': instance.multimedia
    };

MultiMedia _$MultiMediaFromJson(Map<String, dynamic> json) {
  return MultiMedia(json['format'] as String)
    ..url = json['url'] as String
    ..height = json['height'] as int
    ..width = json['width'] as int
    ..type = json['type'] as String
    ..subtype = json['subtype'] as String
    ..caption = json['caption'] as String
    ..copyright = json['copyright'] as String;
}

Map<String, dynamic> _$MultiMediaToJson(MultiMedia instance) =>
    <String, dynamic>{
      'url': instance.url,
      'format': instance.format,
      'height': instance.height,
      'width': instance.width,
      'type': instance.type,
      'subtype': instance.subtype,
      'caption': instance.caption,
      'copyright': instance.copyright
    };
