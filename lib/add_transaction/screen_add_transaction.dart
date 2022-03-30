import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:management/db/category/category_db.dart';
import 'package:management/model/category/category_model.dart';

class screenaddTransaction extends StatefulWidget {
  const screenaddTransaction({Key? key}) : super(key: key);
  static const routeName = 'add-transaction';

  @override
  State<screenaddTransaction> createState() => _screenaddTransactionState();
}

class _screenaddTransactionState extends State<screenaddTransaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategorytype;
  CategoryModel? _selectedCategoryModel;

  String? _categoryID;

  @override
  void initState() {
    _selectedCategorytype = CategoryType.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: 'Purpuse'),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Amount'),
            ),

            // date

            TextButton.icon(
              onPressed: () async {
                final _selectDateTemp = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 30)),
                  lastDate: DateTime.now(),
                );
                if (_selectDateTemp == null) {
                  return;
                } else {
                  print(_selectDateTemp.toString());
                  setState(() {
                    _selectedDate = _selectDateTemp;
                  });
                }
              },
              icon: Icon(Icons.calendar_today),
              label: Text(_selectedDate == null
                  ? 'Select Date'
                  : _selectedDate!.toString()),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio(
                      value: CategoryType.income,
                      groupValue: _selectedCategorytype,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCategorytype = CategoryType.income;
                        });
                      },
                    ),
                    Text('Income'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: CategoryType.expense,
                      groupValue: _selectedCategorytype,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCategorytype = CategoryType.expense;
                          _categoryID = null;
                        });
                      },
                    ),
                    Text('Expense'),
                  ],
                ),
              ],
            ),
            // Dropdown
            DropdownButton<String>(
                hint: const Text('Select Category'),
                value: _categoryID,
                items: (_selectedCategorytype == CategoryType.income
                        ? CategoryDB().incomeCategoryListListener
                        : CategoryDB().expenseCategoryListListener)
                    .value
                    .map((e) {
                  return DropdownMenuItem(value: e.id, child: Text(e.name));
                }).toList(),
                onChanged: (selectedValue) {
                  print(selectedValue);
                  setState(() {
                    _categoryID = selectedValue;
                  });
                }),

            //submit

            ElevatedButton(
              onPressed: () {},
              child: Text('Submit'),
            )
          ],
        ),
      )),
    );
  }
}
