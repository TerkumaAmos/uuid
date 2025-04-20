import 'package:flutter/material.dart';
import 'package:hate/counter.dart';

class Todo extends ChangeNotifier {
  List<String> _todos = [];

  List<String> get todos => _todos;

  void add(String todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void remove(String todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void edit(int index, String newTodo) {
    if (index >= 0 && index < _todos.length) {
      _todos[index] = newTodo;
      notifyListeners();
    }
  }
}
