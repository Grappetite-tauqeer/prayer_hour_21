part of 'prayer_list_bloc.dart';

@immutable
abstract class PrayerListState extends Equatable
{
  PrayerListState([List props = const []]);


}

class InitialPrayerListState extends PrayerListState {

  InitialPrayerListState([List props = const []]);

  @override
  List<Object> get props => props;

}

class PrayerLoading extends PrayerListState {
  PrayerLoading([List props = const []]);
  @override
  List<Object> get props => props;

}

class PrayerLoaded extends PrayerListState {
  final PlayerList prayers;

  PrayerLoaded(this.prayers) : super([prayers]);
  List<Object> get props => props;
}

