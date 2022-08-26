import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'root/tabs.dart';
import 'menu.dart';


class Version{

  static const number = 1.0;
  static const name = "v1.0";
  static const developer = "Aksoylu Systems";
  static const flag = "2022";
  static const developerUrl = "http://umitaksoylu.com";
  static const googlePlayStoreUrl = "";
}

class Network{

  static String IP_ADDR = "127.0.0.1/";
  static int PORT = 0;
  static String HASH_KEY = "";

  static bool IS_CONNECTED = true;
  static Timer connectionCheck = Timer.periodic(Duration(seconds: 10), (timer) {});

  static Socket? socketConnection;
  static List<String> socketBuffer = [];

}

class Variables{

  static List<DeviceOrientation> landingHorizontal = [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight];
  static List<DeviceOrientation> landingVertical = [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown];

}

class Session{
  static String username ="aksoylu98";
  static String userhash = "xyz123";

}


class GlobalState{

  static MainMenuPage mainMenuPage = MainMenuPage();
  static TabsPage tabsPage = const TabsPage();

  static var parent;

  static bool isAppbarActive = false;


  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void navigateTo(context, target, landing){

    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        landing
    ).then((_) {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return AnimatedBuilder(
                    animation: secondaryAnimation,
                    builder: (context, innerChild) {
                      return Transform.scale(
                        scale: (animation.value - secondaryAnimation.value),
                        child: target,
                      );
                    },
                  );
                },
              );
            },
          ),
        );
    });

  }

}

