
import 'package:flutter/material.dart';
import 'package:mvvm_provider_example/todo/view_model/todo_view_model.dart';
import 'package:mvvm_provider_example/todo/widgets/input_field_widget.dart';
import 'package:provider/provider.dart';
import '../widgets/todo_card.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),
      body:
      Consumer<TodoViewModel>(
        builder: (_,vm,__) {
          return Column(
            children: [
              Expanded(
                  child:ListView.builder(
                    itemCount: vm.todos.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        return TodoCard(todo: vm.todos[index], index: index,);
                      }
                  ),
              ),
              const SizedBox(height: 10),
              const InPutFieldWidget()
            ],
          );
        }
      )

    );
  }
}
