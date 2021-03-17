import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'prayer.dart';

part 'prayer_list.g.dart';

@JsonSerializable()
class PlayerList extends Equatable{

  final List<Prayer> prayerList;

  PlayerList(this.prayerList);

  @override
  // TODO: implement props
  List<Object> get props => props;

  factory PlayerList.fromJson(Map<String, dynamic> json) =>
      _$PlayerListFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerListToJson(this);




  static Future<List<Prayer>> addDefaultData(BuildContext context) async {

    String data = await DefaultAssetBundle.of(context).loadString("assets/data.json");

    List<Prayer> list = <Prayer>[];


    for (var word in json.decode(data)) {

      list.add(Prayer(prayerId: word['prayerId'],sortId: word['sortId'] , title: word['title'],detailText: word['detailText'],youtubeId: word['youtubeId']));

    }
    return list;
  }


}


