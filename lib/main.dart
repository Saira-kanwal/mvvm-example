import 'package:flutter/material.dart';
import 'package:mvvm_provider_example/counter_view_model.dart';
import 'package:mvvm_provider_example/slider_view.dart';
import 'package:mvvm_provider_example/slider_view_model.dart';
import 'package:mvvm_provider_example/todo/view_model/todo_view_model.dart';
import 'package:mvvm_provider_example/todo/views/todo_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterViewModel()),
        ChangeNotifierProvider(create: (_) => SliderViewModel()),
        ChangeNotifierProvider(create: (_) => TodoViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodoView() ,
      ),
    );
  }
}



