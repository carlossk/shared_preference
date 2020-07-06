import 'package:flutter/material.dart';
import 'package:shared_preference/src/pages/home_page.dart';
import 'package:shared_preference/src/pages/settings_page.dart';
import 'package:shared_preference/src/providers/user_preferences_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = new UserPreferences();
  await pref.initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   final pref = new UserPreferences();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Preference',
      initialRoute: pref.lastPage,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage()
      },
    );
  }
}
