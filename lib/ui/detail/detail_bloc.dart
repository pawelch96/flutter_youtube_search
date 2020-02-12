import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:youtube_search/ui/detail/detail_event.dart';
import 'package:youtube_search/ui/detail/detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  @override
  DetailState get initialState => DetailInitial();

  @override
  Stream<DetailState> mapEventToState(
    DetailEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
