// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerList _$PlayerListFromJson(Map<String, dynamic> json) {
  return PlayerList(
    (json['prayerList'] as List)
        ?.map((e) =>
            e == null ? null : Prayer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PlayerListToJson(PlayerList instance) =>
    <String, dynamic>{
      'prayerList': instance.prayerList,
    };



