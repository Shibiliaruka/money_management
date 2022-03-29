import 'package:flutter/material.dart';
import 'package:management/home/bottom_navigation.dart';
import 'package:management/category/screen_category.dart';
import 'package:management/screen/screen_transaction.dart';

class screenhome extends StatelessWidget {
  static ValueNotifier<int> selectedindexnotifier = ValueNotifier(0);
  final pages = [screencategory(), screentransaction()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
      bottomNavigationBar: navi(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedindexnotifier.value == 0) {
            print('transaction');
          } else {
            print('category');
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
