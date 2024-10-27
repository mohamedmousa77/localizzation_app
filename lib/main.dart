import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'screens/login-screen.dart';
import 'localizzation/test-localizzation-screen.dart';
import 'localizzation/test-localizzation-services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestLocalizzationHomeScreen(),
      // *Starting the config for the localizzation App
      // ? List of delegates helping for the localizzation.
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // ? List of supported languages:
      supportedLocales: [
        Locale('en', 'EN'), // English
        Locale('ar', 'AR'), // Arabic
      ],
    );
  }
}
