import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/random_activity_model.dart';

abstract class RandomActivityLocalDataSource {
  /// save the data from API to the local phone
  Future<void>? cacheRandomActivity(RandomActivityModel? activityToCache);
  Future<RandomActivityModel>? getLastRandomActivity();

  /// retrieve the data from loacal database into the phone
}

const cachedRandomActivity = 'CACHED_RANDOM_ACTIVIY'; //key

class RandomActivityLocalDataSourceImpl
    implements RandomActivityLocalDataSource {
  final SharedPreferences sharedPreferences;

  /// providing a persistent store for simple data. Data is persisted to disk asynchronousl
  RandomActivityLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<RandomActivityModel>? getLastRandomActivity() {
    final jsonString = sharedPreferences.getString(
        cachedRandomActivity); // retrieve the information from shared preferences
    if (jsonString != null) {
      return Future.value(
          RandomActivityModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void>? cacheRandomActivity(RandomActivityModel? activityToCache) {
    if (activityToCache != null) {
      return sharedPreferences.setString(
          cachedRandomActivity, json.encode(activityToCache.toJson()));
    } else {
      throw CacheException();
    }
  }
}
