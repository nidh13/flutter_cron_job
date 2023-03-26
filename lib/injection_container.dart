/*
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;




final sl = GetIt.instance;

Future<void> init() async {

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();

  // migration
  final migration1to2 = await localDataBaseMigrationCode();

  final appDatabase = await $FloorAppDatabase
      .databaseBuilder('xc_database.db')
      .addMigrations(migration1to2)
      .build();
  */
/*final appDatabase =
      await $FloorAppDatabase.databaseBuilder('xc_database.db').build();*//*

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => appDatabase);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => ImagePicker());
  sl.registerLazySingleton(() => FirebaseStorage.instance);
  sl.registerLazySingleton(
          () => NumberFormat.currency(locale: 'eu', symbol: ''));
}
*/
