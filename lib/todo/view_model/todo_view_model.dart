import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  final todoController = TextEditingController();
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;
  DateTime _dateTime = DateTime.now();

  saveTodo() async
  {
    if (todoController.text.trim().isNotEmpty) {
      var db = await SharedPreferences.getInstance();
      Todo todo = Todo(
          title: todoController.text.trim(),
          status: false,
          dateTime: _dateTime
      );
      _todos.add(todo);
      List <String> data = [];
      data = _todos.map((e) => e.toMap().toString()).toList();
      await db.setStringList("todos", data);
      todoController.clear();
      notifyListeners();
    }
  }

  updateTodo(Todo todo, int index) async
  {
    Todo t = Todo(
      title: todo.title,
      dateTime: todo.dateTime,
      status: todo.status == true ? false : true
    );
    var db = await SharedPreferences.getInstance();
    todos[index]=t;
    List <String> data = [];
    data = _todos.map((e) => e.toMap().toString()).toList();
    await db.setStringList("todos", data);
    notifyListeners();
  }

  deleteTodo(int index) async
  {
    var db = await SharedPreferences.getInstance();
    _todos.removeAt(index);
    List <String> data = [];
    data = _todos.map((e) => e.toMap().toString()).toList();
    await db.setStringList("todos", data);
    notifyListeners();

  }

  getAllTodos() async
  {
    // _todos.clear();
    List<Todo> temp = [];
    var db = await SharedPreferences.getInstance();
    List<String> data = db.getStringList("todos") ?? [];
    // for (int i = 0; i < data.length; i++)
    //   {
    //     String y = data[i].substring(1, data[i].length - 1);
    //     List list = y.split(",");
    //     Map mapData = {};
    //     for (var element in list) {
    //       mapData[element.split(':')[0]] = element.split(':')[1];
    //
    //     }
    //     print(mapData);
    //     temp.add(Todo.fromMap((Map.from(mapData))));
    //   }
    // _todos = temp;

    _todos = data.map((e) {
      var d = json.encode(e);
      Map x = json.decode(d)as Map;
      return Todo.fromMap(x);
    }).toList();
    notifyListeners();
  }

}
