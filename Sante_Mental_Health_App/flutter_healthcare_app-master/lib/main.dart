import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/ar/quotes.dart';
import 'package:flutter_healthcare_app/homepage/src/config/route.dart';
import 'package:flutter_healthcare_app/homepage/src/pages/home_page.dart';
import 'package:flutter_healthcare_app/homepage/src/theme/theme.dart';
import 'package:flutter_healthcare_app/homepage/src/pages/splash_page.dart';
import 'package:flutter_healthcare_app/podcast/model/catalog.dart';
import 'package:flutter_healthcare_app/podcast/widgets/home.dart';
import 'package:flutter_healthcare_app/youtube/screens/home_screen.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart'
    show ArCoreController;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  print('ARCORE IS AVAILABLE?');
  print(await ArCoreController.checkArCoreAvailability());

  print('\nAR SERVICES INSTALLED?');
  print(await ArCoreController.checkIsArCoreInstalled());

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sainte`',
      theme: AppTheme.lightTheme,
      routes: {
        '/': (_) => SplashPage(),
        '/ar': (_) => ARQuotes(),
        '/podcast': (_) => ChangeNotifierProvider(
              create: (context) => CatalogModel(),
              child: PodcastHomePage(),
            ),
        '/youtube': (_) => YoutubeHomeScreen(),
        '/HomePage': (_) => HomePage(),
      },
      onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PodcastHomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Songs',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        primarySwatch: Colors.red,
      ),
      home: AudioServiceWidget(
        child: MyHomePage(title: 'Stress Buster Songs'),
      ),
    );
  }
}
