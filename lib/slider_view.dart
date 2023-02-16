import 'package:flutter/material.dart';
import 'package:mvvm_provider_example/slider_view_model.dart';
import 'package:provider/provider.dart';

class SliderView extends StatelessWidget {
  const SliderView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider"),
      ),
      body: SingleChildScrollView(
        child: Consumer<SliderViewModel>(
          builder: (_,vm,__) {
            return Column(
              children: [
                Slider(
                  value: vm.sliderValue,
                  onChanged: (val){
                    vm.sliderValue = val;
                  },
                  label: "${vm.sliderValue}",
                  activeColor: Colors.red,
                  thumbColor: Colors.blue,
                  inactiveColor: Colors.grey,
                ),
                const SizedBox(height: 20,),
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 50,
                    minHeight: 100,
                  ),
                  height: MediaQuery.of(context).size.height * vm.sliderValue,
                  width: MediaQuery.of(context).size.width * vm.sliderValue,
                  decoration: BoxDecoration(
                    color: vm.switchValue == true ? Colors.green : Colors.grey,
                    borderRadius: BorderRadius.circular(12),

                  ),
                ),
                Switch(
                    value: vm.switchValue,
                    onChanged: (val){
                      vm.switchValue = val ;
                    }
                )

              ],
            );
          }
        ),
      ),
    );
  }
}

