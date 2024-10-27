// ! This file created just to test the LOCALIZZATION.

// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'test-localizzation-services.dart';

class TestLocalizzationHomeScreen extends StatefulWidget {
  const TestLocalizzationHomeScreen({super.key});

  @override
  State<TestLocalizzationHomeScreen> createState() =>
      _TestLocalizzationHomeScreenState();
}

class _TestLocalizzationHomeScreenState
    extends State<TestLocalizzationHomeScreen> {
  String selectedValue = 'English';
  bool isDropdownOpen = false;
  List<String> items = ['English', 'Arabic'];
  // AppLocalizations appLocalizations = AppLocalizations(const Locale('en'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //? The following dropdown menu used to switch between language.
          ElevatedButton(
            onPressed: () {
              setState(() {
                isDropdownOpen = !isDropdownOpen;
              });
            },
            child: Text(selectedValue),
          ),
          Visibility(
            visible: isDropdownOpen,
            child: DropdownButton<String>(
              value: selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  switch (newValue) {
                    case "English":
                      selectedValue = newValue!;
                      isDropdownOpen = false; // Close dropdown after selection
                      //? Sending the selected lang
                      AppLocalizations.of(context)!.getPreferredLang('en');
                      //! Calling the load function to switch the lang
                      AppLocalizations.of(context)!.load();
                    case "Arabic":
                      selectedValue = newValue!;
                      isDropdownOpen = false; // Close dropdown after selection
                      AppLocalizations.of(context)!.getPreferredLang('ar');
                      AppLocalizations.of(context)!.load();
                  }
                });
              },
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
          ),
          //? End of drop down menu.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)?.translate('Localizzation-test') ??
                    'Localizzation test.',
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
            ],
          )
        ],
      ),
    );
  }
}
