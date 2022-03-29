import 'package:flutter/material.dart';

class income_cat extends StatelessWidget {
  const income_cat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctxt, index) {
          return Card(
            elevation: 10,
            child: ListTile(
              title: Text('Income $index'),
              trailing: Icon(Icons.delete),
            ),
          );
        },
        separatorBuilder: (ctxt, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: 100);
  }
}
