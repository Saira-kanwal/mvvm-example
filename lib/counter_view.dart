import 'package:mvvm_provider_example/counter_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(

        title: const Text("Counter App"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
           const SizedBox(height: 15),
           Consumer <CounterViewModel> (
               builder: ( _ ,viewModel, __ )
                   {
                     return Text("${viewModel.count}",
                       style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                     );
                   }
           )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          CounterViewModel vm = context.read<CounterViewModel>();
          vm.addCount();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
