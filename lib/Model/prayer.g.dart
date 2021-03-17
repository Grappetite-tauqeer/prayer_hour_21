// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prayer _$PrayerFromJson(Map<String, dynamic> json) {
  return Prayer(
    prayerId: json['prayerId'] as int,
    sortId: json['sortId'] as int,
    title: json['title'] as String,
    detailText: json['detailText'] as String,
    youtubeId: json['youtubeId'] as String,
  );
}

Map<String, dynamic> _$PrayerToJson(Prayer instance) => <String, dynamic>{
      'prayerId': instance.prayerId,
      'sortId': instance.sortId,
      'title': instance.title,
      'detailText': instance.detailText,
      'youtubeId': instance.youtubeId,
    };
