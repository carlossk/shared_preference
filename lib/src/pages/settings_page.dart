import 'package:flutter/material.dart';
import 'package:shared_preference/src/providers/user_preferences_provider.dart';
import 'package:shared_preference/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor;
  int _gender;
  String _name;
  TextEditingController _textCtrl;
  final pref = new UserPreferences();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pref.lastPage= SettingsPage.routeName;
    _textCtrl = new TextEditingController(text: pref.name);
    _gender = pref.gender;
    _secondaryColor = pref.secondaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Preference'),
            backgroundColor:
                (pref.secondaryColor) ? Colors.pinkAccent : Colors.blue,
          ),
          drawer: MenuWidget(),
          body: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              SwitchListTile(
                value: _secondaryColor,
                title: Text('Secondary color'),
                onChanged: (value) {
                  pref.secondaryColor = value;
                  _secondaryColor = value;
                  setState(() {});
                },
              ),
              RadioListTile(
                value: 1,
                groupValue: _gender,
                onChanged: _setSelectedRadio,
                title: Text('male'),
              ),
              RadioListTile(
                value: 2,
                groupValue: _gender,
                onChanged: _setSelectedRadio,
                title: Text('female'),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _textCtrl,
                  decoration: InputDecoration(
                      labelText: 'Name', helperText: 'User name'),
                  onChanged: (value) {
                    pref.name = value;
                  },
                ),
              )
            ],
          )),
    );
  }

  _setSelectedRadio(int value) {
    pref.gender = value;
    _gender = value;
    setState(() {});
  }
}
