import 'package:flutter/material.dart';
import 'package:shared_preference/src/providers/user_preferences_provider.dart';
import 'package:shared_preference/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final pref = new UserPreferences();



  @override
  Widget build(BuildContext context) {
    pref.lastPage= HomePage.routeName;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: (pref.secondaryColor) ? Colors.pinkAccent : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('secondary color: ${pref.secondaryColor}'),
            Divider(),
            Text('gender: ${pref.gender}'),
            Divider(),
            Text('user name: ${pref.name}'),
            Divider(),
          ],
        ),
      ),
    );
  }
}
