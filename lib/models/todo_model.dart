import 'package:uuid/uuid.dart';

class Todo {
  final String id;
  final String task;
  final DateTime dateAdded;
  bool isCompleted;

  Todo({
    required this.id,
    required this.task,
    required this.dateAdded,
    required this.isCompleted,
  });

  static List<Todo> allTask = [
    // Todo(
    //   id: "task1",
    //   task: "Wash my clothes",
    //   dateAdded: DateTime.now(),
    //   isCompleted: false,
    // ),
    // Todo(
    //   id: "task2",
    //   task: "Write a little code",
    //   dateAdded: DateTime.now(),
    //   isCompleted: false,
    // ),
    // Todo(
    //   id: "task3",
    //   task: "Buy Groceries",
    //   dateAdded: DateTime.now(),
    //   isCompleted: false,
    // ),
    // Todo(
    //   id: "task4",
    //   task: "Wash the plates",
    //   dateAdded: DateTime.now(),
    //   isCompleted: false,
    // ),
  ];
  static String generateId() {
    var uuid = const Uuid();
    return uuid.v4();
  }
}
