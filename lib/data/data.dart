import 'dart:collection';

import 'package:financial_control/models/transactions.dart';
import 'package:flutter/material.dart';

class Operations extends ChangeNotifier {
  double _entrys = 0;
  double _outflow = 0;
  double _total = 0;

  double get entry => _entrys;
  double get outflow => _outflow;
  double get total => _total;

  UnmodifiableListView<Transaction> get lista => UnmodifiableListView(_list);

  final List<Transaction> _list = [];
  addEntrys(double entry) {
    _entrys += entry;
    notifyListeners();
  }

  addOutflow(double outflow) {
    _outflow += outflow;
    notifyListeners();
  }

  setTotal(double total, bool type) {
    if (type) {
      _total += total;
    } else {
      _total -= total;
    }
    notifyListeners();
  }

  addTransaction(Transaction transaction) {
    _list.add(transaction);
    notifyListeners();
  }

  removeTransaction(Transaction transaction) {
    _list.remove(transaction);
    if(transaction.type){
      _entrys -= transaction.value;
      _total -= transaction.value;
    }else{
      _outflow -= transaction.value;
      _total += transaction.value;
    }



    notifyListeners();
  }
}
