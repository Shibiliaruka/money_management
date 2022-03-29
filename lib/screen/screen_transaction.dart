import 'package:flutter/material.dart';

class screentransaction extends StatelessWidget {
  const screentransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            child: ListTile(
              leading: CircleAvatar(
                child: Center(child: Text('10 dec')),
                radius: 30,
              ),
              title: Text('Rs 100'),
              subtitle: Text('salary'),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: 10);
  }
}
