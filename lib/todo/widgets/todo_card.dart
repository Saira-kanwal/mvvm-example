import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_provider_example/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl_browser.dart';
import '../models/todo_model.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final int index;

  const TodoCard({required this.todo,Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(todo.title.toString()),
        subtitle: Text(DateFormat("dd-MMM-yyyy").format(todo.dateTime!)),
        trailing: IconButton(
          splashRadius: 20,
          onPressed: () {
            TodoViewModel vm = context.read<TodoViewModel>();
            vm.updateTodo(todo, index);
          },
          icon: todo.status == true ? const Icon(Icons.check_circle,color: Colors.green,) : const Icon(Icons.circle_outlined,color: Colors.blue,),
        ),
        onLongPress: (){
          showDialog(
              context : context,
              builder: (context){
                return AlertDialog(
                  title:  const Text ("Confirm Delete"),
                  content:  const Text("Do you want to delete this todo?"),
                  actions: [
                    ElevatedButton(
                        onPressed: (){
                          TodoViewModel vm = context.read<TodoViewModel>();
                          vm.deleteTodo(index);
                          Navigator.pop(context);
                        },
                        child: const Text("Yes")
                    ),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Text("No")
                    )
                  ],
                );
              }
          );
        },
      ),
    );
  }
}
