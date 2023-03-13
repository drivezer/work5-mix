import 'package:flutter/foundation.dart';

class BottomMenuProvider extends ChangeNotifier {
  late int indexNumber = 0;
  setIndexNumber(index) {
    indexNumber = index;
  }

  getIndexNumber() {
    return indexNumber;
  }
}
