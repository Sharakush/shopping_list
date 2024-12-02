import 'package:flutter/material.dart';
import 'package:shopping_list/Widgets/grocery_list.dart';


// void main(){
//   runApp(MaterialApp(

//   ));
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(60, 242, 239, 239),
          brightness: Brightness.dark,
          surface: Color.fromARGB(255, 53, 54, 57),
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 89, 90, 91),
      ),
      home: const  GroceryList(),
    );
  }
}