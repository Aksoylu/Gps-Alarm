import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder/geocoder.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../locale.dart';
import '../constant.dart';

//https://flutterawesome.com/whatsapp-clone-ui-for-flutter/
// https://pub.dev/packages/background_location_tracker
class MapPage extends StatefulWidget {
  const MapPage() : super();


  @override
  State<MapPage> createState() => _MapPage();

}
class _MapPage extends State<MapPage> {
  static const String scope = "map";
  Map<String, String>? selectedUser  =  null;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;


    return Scaffold(

        body: Container(
          color: darkBackground,
          child: ListView(
            children: [
              head("abc"),
              const SizedBox(height : 5),
              searchBox(),
              Column(children: <Widget>[
                Container(
                    height: size.height* 0.9,
                    alignment: Alignment.centerLeft,
                    child: mapView()
                )
              ]
              ),

            ],
          )
        )

    );
  }

  Widget head(String group_name){

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 1.0, top: 5),
              child: createButton()
          ),
          Padding(
              padding: const EdgeInsets.only(right: 0, top: 5),
              child: appMarker()
          )

        ]
    );

  }

  var search_controller;

  Widget searchBox(){
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: section,
        borderRadius: BorderRadius.circular(0),
      ),
      child: TextFormField(
        controller: search_controller,
        onTap: ()async{
          /* */
          var query = "1600 Amphiteatre Parkway, Mountain View";
          var addresses = await Geocoder.local.findAddressesFromQuery(query);
          var first = addresses.first;
          print("${first.featureName} : ${first.coordinates}");
          setState(() {
            search_controller.text = first.featureName;
          });

        },
        style: const TextStyle(
          color: white,
        ),
        cursorColor: Colors.white.withOpacity(0.3),
        decoration: InputDecoration(
          prefixIcon: const IconTheme(
              data: IconThemeData(
                  color: Colors.white
              ),
              child: Icon(Icons.search)
          ),
          prefixIconColor: Colors.white,
          border: InputBorder.none,
          hintText: AppLocale.translate(scope, "search"),
          hintStyle: TextStyle(
            color: white.withOpacity(0.8),
            fontSize: 16,
          ),

        ),
      ),
    );
  }

  Widget createButton()
  {
    return InkWell(
        onTap: () {
          showActionSheet("xyz");
        }, // Handle your callback
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: createButtonColor,
                  size: 24,
                ),
              ),
            ),
            Text(
              AppLocale.translate(scope, "create"),
              style: const TextStyle(
                  fontSize: 16,
                  color: createButtonColor,
                  fontWeight: FontWeight.w500),
            )
          ],
        )
    );

  }


  Widget appMarker()
  {
    return InkWell(
        onTap: () {
          showActionSheet("xyz");
          //appMarkerUrl
        }, // Handle your callback
        child: Row(
          children: [
            const Text(
              "GpsAlarm App",
              style: TextStyle(
                  fontSize: 14,
                  color: white,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              width: 32,
              height: 32,
              child: const Center(
                child: Icon(
                  Icons.location_on_outlined,
                  color: white,
                  size: 18,
                ),
              ),
            ),
          ],
        )
    );

  }

  /* Unused */
  Widget deleteButton()
  {
    return InkWell(
        onTap: () {
          showActionSheet("xyz");
        }, // Handle your callback
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              child: const Center(
                child: Icon(
                  Icons.delete,
                  color: deleteButtonColor,
                  size: 24,
                ),
              ),
            ),
            Text(
              AppLocale.translate(scope, "delete"),
              style: const TextStyle(
                  fontSize: 16,
                  color: deleteButtonColor,
                  fontWeight: FontWeight.w500),
            )
          ],
        )
    );

  }


  Widget mapView(){

    var sesList = jsonDecode('[{"X" : "39.990429", "Y": "32.695545"}, {"X" : "39.992429", "Y": "32.693545"} ]');
    //var sesList = jsonDecode(drawCircle(39.990429, 32.695545, 1));

    double p_1 = double.parse(sesList[0]["X"]);
    double p_2 = double.parse(sesList[0]["Y"]);

    var points = <LatLng>[  ];
    for(var item in sesList )
    {
      LatLng lt =  LatLng(double.parse(item["X"]),double.parse( item["Y"]));
      points.add(lt);
    }
    return FlutterMap(
      options: MapOptions(
        center: LatLng(p_1,  p_2),
        zoom: 13.0,
      ),
      layers: [

        TileLayerOptions(
            tileProvider: NetworkTileProvider(),
            urlTemplate: 'http://mt{s}.google.com/vt/lyrs=m@221097413,parking,traffic,lyrs=m&x={x}&y={y}&z={z}',
            subdomains: ['0', '1', '2', '3'],
            maxZoom: 24,
            retinaMode: false
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 200.0,
              height: 200.0,
              point: LatLng(39.990429,  32.695545),
              builder: (ctx) =>
                  Container(
                      child: Text("Place alarm card here ")
                  ),
            ),

          ],
        ),
      ],
    );
  }


  void showActionSheet(notification_data) {
    showCupertinoModalPopup<void>(
      context: this.context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Title'),
        message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// defualt behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Default Action'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Action'),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as delete or exit and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Destructive Action'),
          )
        ],
      ),
    );
  }


}

