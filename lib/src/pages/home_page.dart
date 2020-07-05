import 'package:flutter/material.dart';
import 'package:shared_preference/src/pages/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  static final String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        drawer: MenuWidget(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('secondary color'),
            Divider(),
            Text('gender'),
            Divider(),
            Text('user name'),
            Divider(),
          ],
        ),
      ),
    );
  }


}
