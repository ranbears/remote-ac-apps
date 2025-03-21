import 'package:flutter/material.dart';
import 'package:temperaturapps/detail.dart';
import 'package:temperaturapps/home.dart';
import 'package:temperaturapps/setting.dart';
import 'package:temperaturapps/splash.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/splash',
    routes: {
      '/splash' : (context) => SpalshScreen(),
      '/home' : (context) => LivingRoomPage(),
      '/detail' : (context) => SmartHomePage(),
      '/setting' : (context) => SettingPage(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

