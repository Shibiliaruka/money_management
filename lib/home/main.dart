import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:management/add_transaction/screen_add_transaction.dart';
import 'package:management/model/category/category_model.dart';

import 'package:management/screen/screen_home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:management/model/transaction/transaction_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  runApp(const money());
}

class money extends StatelessWidget {
  const money({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: screenhome(),
        routes: {
          screenaddTransaction.routeName: (ctx) => const screenaddTransaction(),
        });
  }
}
