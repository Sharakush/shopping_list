//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/models/category.dart';

const categories = {
  Categories.vegetables: Category(
    'Vegetables',
    Color.fromARGB(255, 233, 155, 150),
  ),
   Categories.fruit: Category(
    'Spices',
    Color.fromARGB(255, 221, 216, 135),
  ),
   Categories.meat: Category(
    'Convenience',
    Color.fromARGB(255, 158, 234, 188),
  ),
   Categories.dairy: Category(
    'Hygiene',
    Color.fromARGB(255, 163, 143, 229),
  ),
   Categories.sweets: Category(
    'Other',
    Color.fromARGB(255, 78, 92, 238),
  ),
};