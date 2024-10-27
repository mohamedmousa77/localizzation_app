// ! This file take care about everything related to the localizzation BE
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  String preferredLang = '';
  Map<String, String> localizedStrings = {};

  AppLocalizations(this.locale);

  void getPreferredLang(String lang) {
    preferredLang = lang;
    debugPrint('Preferred lang is $preferredLang');
  }

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String currentLang = "";
    if (preferredLang.isEmpty) {
      debugPrint('current lang is if $currentLang');
      currentLang = locale.languageCode;
    } else {
      debugPrint('current lang is else $currentLang');
      currentLang = preferredLang;
    }

    String jsonString =
        await rootBundle.loadString('assets/lang/$currentLang.json');
    debugPrint('current lang is $currentLang');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    return localizedStrings[key] ?? key;
  }
}

//! LocalizationsDelegate is a factory for a set of localized resources
// In this case, the localized strings will be gotten in an AppLocalizations object
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  //! This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    debugPrint("Current language is ${locale.languageCode}");
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
