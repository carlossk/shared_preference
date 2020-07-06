import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();
  SharedPreferences _pref;

  initPreferences() async {
    _pref = await SharedPreferences.getInstance();
  }

  get gender {
    return _pref.getInt('gender') ?? 1;
  }

  set gender(value) {
    _pref.setInt('gender', value);
  }

  get name {
    return _pref.getString('name') ?? 'N/A';
  }

  set name(value) {
    _pref.setString('name', value);
  }

  get secondaryColor {
    return _pref.getBool('secondaryColor') ?? false;
  }

  set secondaryColor(value) {
    _pref.setBool('secondaryColor', value);
  }

  set lastPage(value) {
    _pref.setString('lastPage', value);
  }

  get lastPage {
    return _pref.getString('lastPage') ?? 'home';
  }
}
