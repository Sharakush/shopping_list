import 'package:shopping_list/models/category.dart';
//import 'package:shopping_list/data/dummy_items.dart';

class GroceryItem {
  const GroceryItem({
    required this.id,
    required this.name,
    //required is used beacause name and other thins are optional
    required this.quantity,
    required this.category,});

  final String id;
  final String name;
  final int quantity;
  final Category category;
}
