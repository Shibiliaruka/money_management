import 'package:flutter/material.dart';
import 'package:management/bottom_navigation.dart';
import 'package:management/screen_category.dart';
import 'package:management/screen_transaction.dart';

class screenhome extends StatelessWidget {
  const screenhome({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedindexnotifier = ValueNotifier(0);
  final pages = const [screencategory(), screentransaction()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Money Management'),
        ),
        body: SafeArea(
            child: ValueListenableBuilder(
          valueListenable: selectedindexnotifier,
          builder: (BuildContext context, int updatedindex, Widget? _) {
            return pages[updatedindex];
          },
        )),
        bottomNavigationBar: navi());
  }
}
