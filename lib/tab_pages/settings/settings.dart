import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../globals.dart';
import '../constant.dart';


class Settings extends StatefulWidget {
  const Settings() : super();


  @override
  State<Settings> createState() => _Settings();

}


List markedLocationSection = [
  {
    "icon": Icons.star,
    "text": "Marked Locations",
    "color": Colors.yellow[700]
  }
];

List settingSection = [
  {
    "icon": Icons.notification_important,
    "text": "Notifications",
    "color": Colors.redAccent,
    "action" : ()=>{
      /* Event Handler */
    }
  },
  {
    "icon": Icons.gps_fixed_outlined,
    "text": "GPS and Data Usage",
    "color": Colors.green,
    "action" : ()=>{
      /* Event Handler */
    }
  },
];

List infoSection = [
  {
    "icon": Icons.info_outline,
    "text": "Help",
    "color": Colors.blue[600],
    "action" : ()=>{
      /* Event Handler */
    }
  },
  {
    "icon": Icons.favorite_rounded,
    "text": "Tell a Friend",
    "color": Colors.red[400],
    "action" : ()=>{
      /* Event Handler */
    }
  },
  {
    "icon": Icons.thumb_up_sharp,
    "text": "Vote on Google Play Store",
    "color": green,
    "action" : ()=>{
      /* Event Handler */
    }
  },
];

class _Settings extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return  Container(
      color: darkBackground,
      child:ListView(
          children: [
            header(),
            seperator(),
            renderPrimarySection(),
            seperator(),
            renderConfigSection(),
            seperator(),
            renderInfoSection(),
            seperator(),
            aboutSection(size),

          ])
    );
  }

  Widget seperator(){
    return const SizedBox(
      height: 30,
    );
  }

  Widget header(){
    return const Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Text(
        "Settings",
        style: TextStyle(
            fontSize: 23, color: Colors.white, fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget renderPrimarySection(){
    return Column(
        children: List.generate(markedLocationSection.length, (index) {
          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: section),
            child: Padding(
              padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: markedLocationSection[index]['color']),
                            child: Center(
                              child: Icon(
                                markedLocationSection[index]['icon'],
                                color: white,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            markedLocationSection[index]['text'],
                            style: const TextStyle(
                                fontSize: 16,
                                color: white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: white.withOpacity(0.2),
                        size: 15,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }

  Widget renderConfigSection(){
    return  Column(
        children: List.generate(settingSection.length, (index) {
          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: section),
            child: Padding(
              padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: settingSection[index]['color']),
                            child: Center(
                              child: Icon(
                                settingSection[index]['icon'],
                                color: white,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            settingSection[index]['text'],
                            style: const TextStyle(
                                fontSize: 16,
                                color: white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: white.withOpacity(0.2),
                        size: 15,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }

  Widget renderInfoSection(){
    return Column(
        children: List.generate(infoSection.length, (index) {
          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: section),
            child: Padding(
              padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: infoSection[index]['color']),
                            child: Center(
                              child: Icon(
                                infoSection[index]['icon'],
                                color: white,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            infoSection[index]['text'],
                            style: const TextStyle(
                                fontSize: 16,
                                color: white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: white.withOpacity(0.2),
                        size: 15,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }


  Widget aboutSection(Size size){
    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      child: Padding(
        padding:
        const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
        child: Column(
          children: [
            InkWell(
              onTap: () =>{
                launchURL(Version.developerUrl)
                /* Event Handler */
              },
              child : Image.asset('assets/aksoylu.png')
            ),

            seperator(),
            InkWell(
              onTap: () =>{
                launchURL(Version.developerUrl)
                /* Event Handler */
              },
               child: const Text("${Version.developer} ® ${Version.flag}", style: TextStyle(color:white))
            ),
            const SizedBox(height:15),
            InkWell(
              onTap:() =>{
              launchURL(Version.googlePlayStoreUrl)
                /* Event Handler */
              },
              child: const Text("Version : ${Version.name} ", style: TextStyle(color:white))
            ),

        ]
      )
    )
    );
  }


  void launchURL(String _url) async {
    await launch(_url, forceSafariVC: false);

  }

}