import 'package:flutter/material.dart';
import 'package:management/category/expense_category.dart';
import 'package:management/category/income_category.dart';
import 'package:management/db/category/category_db.dart';

class screencategory extends StatefulWidget {
  @override
  State<screencategory> createState() => _screencategoryState();
}

class _screencategoryState extends State<screencategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().refreshU();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                child: Text('income'),
              ),
              Tab(
                child: Text('expence'),
              ),
            ]),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            income_cat(),
            expense_cat(),
          ]),
        ),
      ],
    );
  }
}
