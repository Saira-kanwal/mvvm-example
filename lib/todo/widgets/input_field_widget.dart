import 'package:flutter/material.dart';
import 'package:mvvm_provider_example/todo/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class InPutFieldWidget extends StatelessWidget {
  const InPutFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoViewModel vm = context.read<TodoViewModel>();
    return Padding(
      padding: const EdgeInsets.all(0.8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20)
            ),
            width: MediaQuery.of(context).size.width*0.80,
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child:TextField(
              controller: vm.todoController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Please Enter your Todos...'
              ),
            ),
          ),
          CircleAvatar(
            radius: 25,
            child: IconButton(
                onPressed: (){
                  vm.saveTodo();

                },
                icon: const Icon(Icons.send)
            ),
          )
        ],
      ),
    );
  }
}
