import 'package:flutter/material.dart';
import 'package:management/add_transaction/screen_add_transaction.dart';
import 'package:management/category/category_add_popup.dart';
import 'package:management/db/category/category_db.dart';
import 'package:management/home/bottom_navigation.dart';
import 'package:management/screen/screen_category.dart';
import 'package:management/model/category/category_model.dart';
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
            print('category');
            showCategoryAddPopup(context);

            // final _sample = CategoryModel(
            //     id: DateTime.now().millisecondsSinceEpoch.toString(),
            //     name: 'Travel',
            //     type: CategoryType.expense);
            // CategoryDB().insertCategory(_sample);
            // showCategoryAddPopup(context);
          } else {
            print('transaction');
            Navigator.of(context).pushNamed(screenaddTransaction.routeName);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
