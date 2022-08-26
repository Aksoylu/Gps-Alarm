import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../tab_pages/settings/settings.dart';
import '../tab_pages/map/map.dart';

import '../globals.dart';
import 'constant.dart';


class TabsPage extends StatefulWidget {

  const TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPage();

}

class _TabsPage extends State<TabsPage> with SingleTickerProviderStateMixin {

  List<TabItem> tab_items = <TabItem>[
    const TabItem(icon: Icons.map, title: 'Map'),
    const TabItem(icon: Icons.settings, title: 'Settings'),
  ];


  void refreshUICallback(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    GlobalState.parent = this;

    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: testAppBar(),
          bottomNavigationBar: StyleProvider(
            style: Style(),
            child: ConvexAppBar(
              disableDefaultTabController: false,
              curveSize: 100,
              style: TabStyle.reactCircle,
              items: tab_items,
              backgroundColor: primary,
              onTap: (i) => debugPrint('click $i'),
            ),
          ),
            body: const TabBarView(
              children: [
                MapPage(),
                Settings()
              ],
            )
        )
    );
  }

  Widget builder() {
    return ConvexAppBar.builder(
      itemBuilder: _CustomBuilder(tab_items, primary),
      count: tab_items.length,
      backgroundColor: primary,
    );
  }

  PreferredSizeWidget testAppBar(){
    double size = 0;
    if(GlobalState.isAppbarActive)
      size = 50;

      return PreferredSize(
          preferredSize: Size.fromHeight(size),
          child: AppBar(
            title: const Text('Aksoylu Systems - BETA'),
            backgroundColor: primary,

          )
      );
  }



}

class _CustomBuilder extends DelegateBuilder {
  final List<TabItem> items;
  final Color _tabBackgroundColor;

  _CustomBuilder(this.items, this._tabBackgroundColor);

  @override
  Widget build(BuildContext context, int index, bool active) {
    var navigationItem = items[index];
    var _color = active ? Colors.white : Colors.white60;

    if (index == items.length ~/ 2) {
      return Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(shape: BoxShape.circle, color: _color),
        child: Icon(
          Icons.add,
          size: 40,
          color: _tabBackgroundColor,
        ),
      );
    }
    var _icon = active
        ? navigationItem.activeIcon ?? navigationItem.icon
        : navigationItem.icon;
    var _title = navigationItem.title ?? "";
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(bottom: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(_icon, color: _color),
          Text(_title, style: TextStyle(color: _color))
        ],
      ),
    );
  }

  @override
  bool fixed() {
    return true;
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 30;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 16;

  @override
  TextStyle textStyle(Color color) {
    return TextStyle(fontSize: 12, color: color);
  }
}