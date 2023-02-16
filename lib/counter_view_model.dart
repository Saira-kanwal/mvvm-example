
import 'package:flutter/cupertino.dart';

class CounterViewModel extends ChangeNotifier{
  int _count = 0;
  int get count => _count;
  void addCount(){
    _count++;
    notifyListeners();
  }
}