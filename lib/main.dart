import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_hive/constants/app_constants.dart';
import 'package:todo_hive/constants/app_localizations.dart';
import 'package:todo_hive/presentation/add_phone_number/add_phone_number.dart';
import 'package:todo_hive/presentation/future_stream/future_builder_page.dart';
import 'package:todo_hive/presentation/future_stream/stream_builder_page.dart';
import 'package:todo_hive/presentation/home/home_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_hive/routes/app_pages.dart';
import 'package:todo_hive/routes/app_routes.dart';

import 'data/model/task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///hive ni initialize qilish
 // await initHive();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('todo_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.initial,
      routes: AppPages.routes,
      navigatorKey: AppConstants.navigatorKey,
      scaffoldMessengerKey: AppConstants.scaffoldMessengerKey,
      locale: const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('uz', 'UZ'),
        Locale('en', 'US'),
      ],
    );
  }
}

late Box<dynamic> box;
// Future<void> initHive() async {
//   const boxName = 'uacademy_box';
//   final Directory directory = await getApplicationDocumentsDirectory();
//   Hive.init(directory.path);
//   box = await Hive.openBox<dynamic>(boxName);
// }
