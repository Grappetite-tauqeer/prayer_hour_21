import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'prayer.g.dart';

@JsonSerializable()
class Prayer extends Equatable {

  final int prayerId;
  final int sortId;
  final String title;
  final String detailText;
  final String youtubeId;

  Prayer({this.prayerId,this.sortId,this.title,this.detailText,this.youtubeId});

  @override
  // TODO: implement props
  List<Object> get props => props;


  factory Prayer.fromJson(Map<String, dynamic> json) =>
      _$PrayerFromJson(json);
  Map<String, dynamic> toJson() => _$PrayerToJson(this);






}