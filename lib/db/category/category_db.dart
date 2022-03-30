import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:management/model/category/category_model.dart';

const Category_db_name = 'category-database';

abstract class CategoryDbFunction {
  Future<List<CategoryModel>> getAllCategory();
  Future<void> insertCategory(CategoryModel value);
  Future<void> deleteCategory(String categoryID);
}

class CategoryDB implements CategoryDbFunction {
  CategoryDB._internal();

  static CategoryDB instance = CategoryDB._internal();

  factory CategoryDB() {
    return instance;
  }

  ValueNotifier<List<CategoryModel>> incomeCategoryListListener =
      ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseCategoryListListener =
      ValueNotifier([]);
  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(Category_db_name);
    await _categoryDB.put(value.id, value);
    refreshU();
  }

  @override
  Future<List<CategoryModel>> getAllCategory() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(Category_db_name);
    return _categoryDB.values.toList();
  }

  Future<void> refreshU() async {
    final _allCategories = await getAllCategory();
    incomeCategoryListListener.value.clear();
    expenseCategoryListListener.value.clear();
    await Future.forEach(_allCategories, (CategoryModel category) {
      if (category.type == CategoryType.income) {
        incomeCategoryListListener.value.add(category);
      } else {
        expenseCategoryListListener.value.add(category);
      }
    });
    incomeCategoryListListener.notifyListeners();
    expenseCategoryListListener.notifyListeners();
  }

  @override
  Future<void> deleteCategory(String categoryID) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(Category_db_name);
    await _categoryDB.delete(categoryID);
    refreshU();
  }
}
