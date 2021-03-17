part of 'prayer_list_bloc.dart';

@immutable
abstract class PrayerListEvent extends Equatable {
  PrayerListEvent([List props = const []]);
}

class GetList extends PrayerListEvent {

  final BuildContext context;

  GetList(this.context) : super();


  List<Object> get props => props;



}
