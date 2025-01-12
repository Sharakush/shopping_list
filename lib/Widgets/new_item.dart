import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formkey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;

  void _saveItem() {
   if( _formkey.currentState!.validate()){
    _formkey.currentState!.save();
   // Navigator.of(context).pop(GroceryItem(id: id, name: name, quantity: quantity, category: category))
    // print(_enteredName);
    // print(_enteredQuantity);
    // print(_selectedCategory);
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formkey,
            child: Column(
          children: [
            TextFormField(
              //instead of formfield
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Name'),
              ),
              validator: (value) {
                // used to displlay the error
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length <= 1 ||
                    value.trim().length > 50) {
                      return 'Must be between 1 and 50 characters.';
                    } 
                    return null;
              },
              onSaved: (value) { 
                // if(value == null ){
                //   return;
                // }

                _enteredName = value!;
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    //it is unconstarined as the row so we have to expand it
                    decoration: const InputDecoration(
                      label: Text('Qunatity'),
                    ),
                    keyboardType: TextInputType.number,
                    initialValue: '1',
                      validator: (value) {
                // used to displlay the error
                if (value == null ||
                    value.isEmpty ||
                    int.tryParse(value) == null ||
                    int.tryParse(value)! <= 0) {
                      return 'Must be a valid positive number.';
                    } 
                    return null;
                },
                onSaved: (value){
                  _enteredQuantity = int.parse(value!);
                },
               ),
             ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField(
                     value: _selectedCategory,
                    items: [
                    for (final category in categories.entries)
                      DropdownMenuItem(
                        value: category.value,
                        child: Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              color: category.value.color,
                            ),
                            const SizedBox(width: 6),
                            Text(category.value.title),
                          ],
                        ),
                      ),
                  ], onChanged: (value) {
                    setState(() {
                        _selectedCategory = value!;
                    });
                  
                  }),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    _formkey.currentState!.reset();
                  },
                  child: const Text('Reset'),
                ),
                ElevatedButton(onPressed: _saveItem, child: const Text('Add Item')),
              ],
            )
          ],
        )),
      ),
    );
  }
}
