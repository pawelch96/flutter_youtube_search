library page_info;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:youtube_search/data/model/serializer/serializers.dart';

part 'page_info.g.dart';

abstract class PageInfo implements Built<PageInfo, PageInfoBuilder> {
  int get totalResults;
  int get resultsPerPage;

  PageInfo._();

  factory PageInfo([updates(PageInfoBuilder b)]) = _$PageInfo;

  String toJson() {
    return json.encode(serializers.serializeWith(PageInfo.serializer, this));
  }

  static PageInfo fromJson(String jsonString) {
    return serializers.deserializeWith(
        PageInfo.serializer, json.decode(jsonString));
  }

  static Serializer<PageInfo> get serializer => _$pageInfoSerializer;
}
