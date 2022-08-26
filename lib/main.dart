import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpsalarm/menu.dart';
import 'package:gpsalarm/root/tabs.dart';
import 'globals.dart';
import 'menu.dart';


/* DO NOT EDIT THIS PAGE */

void main() {
  GlobalState.mainMenuPage  = MainMenuPage();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      Variables.landingVertical
  ).then((_) {
    runApp(mainContent());
  });

}

class mainContent extends StatelessWidget {

  late BuildContext mainContentContext;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    mainContentContext = context;
    return
      const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabsPage(),
    );
  }
}

