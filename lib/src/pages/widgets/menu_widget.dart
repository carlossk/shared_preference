import 'package:flutter/material.dart';
import 'package:shared_preference/src/pages/home_page.dart';
import 'package:shared_preference/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _createMenu(context);
  }

  Drawer _createMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/menu-img.jpg'),
                        fit: BoxFit.cover)),
              )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, HomePage.routeName),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.party_mode),
            title: Text('Party test'),
            onTap: () {},
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('People'),
            onTap: () {},
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            },
            trailing: Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }
}
