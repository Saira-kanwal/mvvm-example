import 'package:flutter/cupertino.dart';

class SliderViewModel extends ChangeNotifier{
  double _sliderValue = 0;
  bool _switchValue = false;

  double get sliderValue => _sliderValue;
  bool get switchValue => _switchValue;

  set sliderValue(double val)
  {
    _sliderValue = val;
    notifyListeners();
  }

  set switchValue(bool val)
  {
    _switchValue = val;
    notifyListeners();
  }
}