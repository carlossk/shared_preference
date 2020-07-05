import 'package:flutter/material.dart';
import 'package:shared_preference/src/pages/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor = true;
  int _gender = 1;
  String _name = 'Carlos';
  TextEditingController _textCtrl;

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    SharedPreferences preft = await SharedPreferences.getInstance();
    _gender = preft.getInt('gender');
    _textCtrl = new TextEditingController(text: _name);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Preference'),
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
                  onChanged: (value) {},
                ),
              )
            ],
          )),
    );
  }

  _setSelectedRadio(int value) async {
    SharedPreferences preft = await SharedPreferences.getInstance();
    await preft.setInt('gender', value);
    _gender = value;
    setState(() {});
  }
}
