import 'package:flutter/material.dart';
import 'package:management/db/category/category_db.dart';
import 'package:management/model/category/category_model.dart';

class expense_cat extends StatelessWidget {
  const expense_cat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: CategoryDB().expenseCategoryListListener,
        builder:
            (BuildContext context, List<CategoryModel> newlist, Widget? _) {
          return ListView.separated(
              itemBuilder: (ctxt, index) {
                final category = newlist[index];
                return Card(
                  elevation: 10,
                  child: ListTile(
                    title: Text(category.name),
                    trailing: IconButton(
                      onPressed: () {
                        CategoryDB.instance.deleteCategory(category.id);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                );
              },
              separatorBuilder: (ctxt, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: newlist.length);
        });
  }
}
