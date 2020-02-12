library detail_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:youtube_search/data/model/detail/video_item.dart';

part 'detail_state.g.dart';

abstract class DetailState implements Built<DetailState, DetailStateBuilder> {
  bool get isLoading;
  @nullable
  VideoItem get videoItem;
  String get error;

  DetailState._();

  factory DetailState([updates(DetailStateBuilder b)]) = _$DetailState;
}
