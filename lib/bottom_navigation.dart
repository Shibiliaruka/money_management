import 'package:flutter/material.dart';
import 'package:management/screen_home.dart';

class navi extends StatelessWidget {
  const navi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: screenhome.selectedindexnotifier,
        builder: (BuildContext context, int updatedindex, Widget? _) {
          return BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: 'Category'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.transit_enterexit), label: 'Category'),
              ],
              onTap: (int index) {
                screenhome.selectedindexnotifier.value = index;
              },
              currentIndex: updatedindex);
        });
  }
}
