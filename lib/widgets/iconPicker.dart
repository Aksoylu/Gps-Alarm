import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

typedef void IconCallback(int iconIndex);



class IconPicker extends StatefulWidget {
  final IconCallback callback = (int i) =>{};
  IconPicker( {Key? key, required IconCallback callback}) : super(key: key);

  int selectedIconIndex = 0;

  @override
  State<IconPicker> createState() => _IconPicker();
}

class _IconPicker extends State<IconPicker> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return  SizedBox(
        height: size.height * 0.2,
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => {
              widget.callback(widget.selectedIconIndex),
              Navigator.pop(context)

            },// write what you want to do,
            child:  CupertinoPicker(
          magnification: 1.25,
          squeeze: 1.2,
          useMagnifier: true,
          itemExtent: 32,
          // This is called when selected item is changed.

          onSelectedItemChanged: (int selectedItem) {
            widget.selectedIconIndex = selectedItem;
          },
          children:
          List<Widget>.generate(selectableIconList.length, (int index) {
            return Center(
              child: Icon(selectableIconList[index])
            );
          }),
        )
    ),


    );

  }
}