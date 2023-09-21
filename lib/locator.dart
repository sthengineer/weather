import 'package:get_it/get_it.dart';
import 'package:weather/features/weather/data/datasources/remote/api_provider.dart';
import 'package:weather/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather/features/weather/domain/usecases/get_current_weather_use_case.dart';
import 'package:weather/features/weather/presentation/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

setup() {
  locator.registerSingleton<ApiProvider>(ApiProvider());

  //repository
  locator
      .registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));

  //use cases
  locator.registerSingleton<GetCurrentWeatherUseCase>(
      GetCurrentWeatherUseCase(locator()));

  //blocs
  locator.registerSingleton<HomeBloc>(HomeBloc(locator()));
}
