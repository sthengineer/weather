import 'package:dio/dio.dart';

import '../../../../core/resources/data_state.dart';
import '../datasources/remote/api_provider.dart';
import '../models/current_city_model.dart';
import '../../domain/entities/current_city_entity.dart';
import '../../domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  ApiProvider apiProvider;

  WeatherRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(
      String cityName) async {
    try {
      Response response = await apiProvider.callCurrentWeather(cityName);
      if (response.statusCode == 200) {
        CurrentCityEntity currentCityEntity =
            CurrentCityModel.fromJson(response.data);

        return DataSuccess(currentCityEntity);
      } else {
        return const DataFailed("Something Went Wrong. try again...");
      }
    } catch (e) {
      return const DataFailed("please check your connection...");
    }
  }
}
