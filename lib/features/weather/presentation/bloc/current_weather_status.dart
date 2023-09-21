import 'package:flutter/cupertino.dart';
import 'package:weather/features/weather/domain/entities/current_city_entity.dart';

@immutable
abstract class CurrentWeatherStatus {
}

class CurrentWeatherLoading extends CurrentWeatherStatus {}

class CurrentWeatherCompleted extends CurrentWeatherStatus {
  final CurrentCityEntity currentCityEntity;

  CurrentWeatherCompleted(this.currentCityEntity);
}

class CurrentWeatherError extends CurrentWeatherStatus {
  final String massage;

  CurrentWeatherError(this.massage);
}
