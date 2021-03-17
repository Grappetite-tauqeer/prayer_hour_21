import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../Model/prayer.dart';
import '../../Model/prayer_list.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'prayer_list_event.dart';

part 'prayer_list_state.dart';

class PrayerListBloc extends HydratedBloc<PrayerListEvent, PrayerListState> {

  PrayerListBloc() : super(InitialPrayerListState()) {
    hydrate();
  }

  @override
  Stream<PrayerListState> mapEventToState(PrayerListEvent event) async* {
    // TODO: Add your event logic
    if (event is GetList) {
      GetList currentEvent = event;
      yield PrayerLoading();
      final weather  = await _fetchPrayers(currentEvent.context);
      yield PrayerLoaded(weather);

    }

  }

  Future<PlayerList> _fetchPrayers(BuildContext context) async {
    // Simulate network delay
    PlayerList pList = PlayerList(await PlayerList.addDefaultData(context));
    return pList;
  }


  @override
  PrayerListState fromJson(Map<String, dynamic> json) {

    try{
      final list = PlayerList.fromJson(json);
      return PrayerLoaded(list);
    }
    catch(_){
      return null;

    }
  }

  @override
  Map<String, dynamic> toJson(PrayerListState state) {
    return (state is PrayerLoaded) ? state.prayers.toJson() : null;
  }


}
