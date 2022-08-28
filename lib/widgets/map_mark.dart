import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpsalarm/widgets/constant.dart';
import 'flutter_balloon_slider/flutter_balloon_slider.dart';
import 'iconPicker.dart';

typedef void IconCallback(IconData icon);

class MapAlarmCard extends StatelessWidget {
  final Map<String, String> details;

  MapAlarmCard({Key? key, required this.details}) : super(key: key);

  IconData selectedIcon = Icons.gps_fixed_outlined;
  Color selectedColor = primary;

  static const Map cardInfo = {"icon": Icons.add, "b": "d"};

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: InkWell(
            onTap: () => {showActionSheet(context, details)},
            child: SizedBox(
              width: 200,
              height: 50,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.add, color: primary),
                      Expanded(
                          child: Text(
                        'Card detail name sdfsdfsdfdsf',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: primary),
                      ))
                    ],
                  )),
            ),
          )),
    );
  }


  void showActionSheet(BuildContext context, notificationData) {
    var size = MediaQuery.of(context).size;

    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoPopupSurface(
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).copyWith().size.height * 0.6,
                  child: DefaultTextStyle(
                    style : TextStyle(),
                    child: Column(
                      children: [
                        SizedBox(height:  size.height * 0.05),
                        Label("Radius"),
                        RadiusSelector(size),
                        Label("Note"),
                        DetailInput(size, context),
                        Label("Select Color"),
                        ColorSelector(size, context),
                        Label("Select Icon"),
                        IconSelector(size, context),
                        CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Save',
                              style: TextStyle(color: primary)),
                        ),
                      ],
                    )
                  )),
              isSurfacePainted: true,
            ));
  }

  Widget Label(text) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Column(
          children: [
            Text(text, style: TextStyle(
                color: grayText,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                fontFamily: 'Arial'

            ))
          ],
        ));
  }

  Widget DetailInput(size, content) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(size.width * 0.175, 0, size.width * 0.175, 5),
      child: const CupertinoTextField(),
    );
  }

  Widget IconSelector(size, context) {
    return SizedBox(
        height: size.height * 0.1,
        child: Padding(
            padding:
                EdgeInsets.fromLTRB(size.width * 0.15, 0, size.width * 0.15, 5),
            child: CupertinoPicker(
              magnification: 1.25,
              squeeze: 1.2,
              useMagnifier: true,
              itemExtent: 32,
              onSelectedItemChanged: (int selectedIconIndex) {
                selectedIcon = selectableIconList[selectedIconIndex];
              },
              children:
                  List<Widget>.generate(selectableIconList.length, (int index) {
                return Center(child: Icon(selectableIconList[index]));
              }),
            )));
  }

  Widget ColorSelector(size, context) {
    return SizedBox(
        height: size.height * 0.1,
        child: Padding(
            padding:
                EdgeInsets.fromLTRB(size.width * 0.15, 0, size.width * 0.15, 5),
            child: CupertinoPicker(
              magnification: 1.25,
              squeeze: 1.2,
              useMagnifier: true,
              itemExtent: 32,
              onSelectedItemChanged: (int selectedColorIndex) {
                selectedColor = selectableColorList[selectedColorIndex];
              },
              children: List<Widget>.generate(selectableColorList.length,
                  (int index) {
                return Center(
                    child: Icon(Icons.format_paint,
                        color: selectableColorList[index]));
              }),
            )));
  }

  Widget RadiusSelector(size) {
    return BalloonSlider(
        percent: 0.1,
        ropeLength: 35,
        showRope: true,
        onChangeStart: (val) {},
        onChanged: (val) {},
        onChangeEnd: (val) {},
        color: primary,
        maxValue: 5000,
    );
  }
}
