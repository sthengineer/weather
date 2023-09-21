import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/weather/presentation/bloc/current_weather_status.dart';

import '../../domain/usecases/get_current_weather_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;

  HomeBloc(this.getCurrentWeatherUseCase)
      : super(
          HomeState(currentWeatherStatus: CurrentWeatherLoading()),
        ) {
    on<CurrentWeatherEvent>(
      (event, emit) async {
        emit(state.copyWith(
          newWeatherStatus: CurrentWeatherLoading(),
        ));
        DataState dataState = await getCurrentWeatherUseCase(event.cityName);
        if (dataState is DataSuccess) {
          emit(
            state.copyWith(
              newWeatherStatus: CurrentWeatherCompleted(dataState.data),
            ),
          );
        }
        if (dataState is DataFailed) {
          emit(
            state.copyWith(
              newWeatherStatus: CurrentWeatherError(dataState.error!),
            ),
          );
        }
      },
    );
  }
}
