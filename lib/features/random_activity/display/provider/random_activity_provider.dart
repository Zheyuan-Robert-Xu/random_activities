import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:random_activities/core/connection/network_info.dart';
import 'package:random_activities/core/errors/failures.dart';
import 'package:random_activities/core/usecases/usecase.dart';
import 'package:random_activities/features/random_activity/data/datasources/random_activity_local_data_source.dart';
import 'package:random_activities/features/random_activity/data/datasources/random_activity_remote_data_source.dart';
import 'package:random_activities/features/random_activity/data/repositories/random_activity_repository_impl.dart';
import 'package:random_activities/features/random_activity/domain/entities/random_activity.dart';
import 'package:random_activities/features/random_activity/domain/usecases/get_random_activity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomActivityProvider extends ChangeNotifier {
  RandomActivity? randomActivity;
  Failure? failure;
  RandomActivityProvider({this.randomActivity, this.failure});
  void eitherFailureOrActivity() async {
    RandomActivityRepositoryImpl repository = RandomActivityRepositoryImpl(
      remoteDataSource: RandomActivityRemoteDataSourceImpl(dio: Dio()),
      localDataSource: RandomActivityLocalDataSourceImpl(
          sharedPreferences: await SharedPreferences.getInstance()),
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
    );
    final failureOrActivity = await GetRandomActivity(repository)
        .call(NoParams()); // make sure failureOrActivity is not empty
    failureOrActivity?.fold((newFailure) {
      randomActivity = null;
      failure = newFailure;
      notifyListeners();
    }, (activity) {
      randomActivity = activity;
      failure = null;
      notifyListeners();
    });
  }
}
