import 'dart:async';

import 'package:flutter/material.dart';
import 'globals.dart';

void menu() {
  runApp(GlobalState.mainMenuPage);
}

void switchToQrReader(context){
  //GlobalState.navigateTo(context, GlobalState.qrScannerPage, Variables.landingVertical);
}

/* USER INTERFACE */

class MainMenuPage extends StatefulWidget {

  @override
  State<MainMenuPage> createState() => _MainMenuPage();

}


class _MainMenuPage extends State<MainMenuPage> {



  late Widget Main;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height =  MediaQuery.of(context).size.height;

    Main = main(width, height);
    return Main;

  }

  Widget main(width,height,){
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
          children :<Widget>[

            Positioned(
                top: height * 0.10,
                left: width * 0.15,
                child : Image(
                  image: AssetImage("assets/raylink_logo.png"),//NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  width: width * 0.70,
                  height: height * 0.30,
                )
            ),

            if (Network.IS_CONNECTED)
              Positioned(
                  top: height * 0.30,
                  left: width * 0.35,
                  child : Text(
                      "Connected to client",
                      style: TextStyle(color: Colors.green))
              ),


            if (Network.IS_CONNECTED)
              Positioned(
                  top: height * 0.45,
                  left: width * 0.22,
                  child : MaterialButton(
                    color: Colors.black87,
                    minWidth: width * 0.60,
                    child: Text(
                        "Switch to Gamepad Mode",
                        style: TextStyle(color: Colors.white)),
                    onPressed: (){

                    },
                  )
              ),

            if (Network.IS_CONNECTED)
              Positioned(
                  top: height * 0.55,
                  left: width * 0.22,
                  child : MaterialButton(
                    color: Colors.black87,
                    minWidth: width * 0.60,
                    child: Text(
                        "Switch to Gyroscope Mode",
                        style: TextStyle(color: Colors.white)),
                    onPressed: (){

                    },
                  )
              ),

              Positioned(
                  top: height * 0.65,
                  left: width * 0.22,
                  child : MaterialButton(
                    color: Colors.black87,
                    minWidth: width * 0.60,
                    child: Text(
                        "Switch to Pointer Mode",
                        style: TextStyle(color: Colors.white)),
                    onPressed: (){

                    },
                  )
              ),

            Positioned(
                top: height * 0.75,
                left: width * 0.28,
                child : ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange
                  ),
                  onPressed: () {
                    // Respond to button press
                  },
                  icon: Icon(Icons.add, size: 18),
                  label: Text("Login with Google"),
                )
            ),


          ]

      ),
    );
  }



}
