import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask(this.completedTask, {super.key});

  final List<Todo> completedTask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: completedTask.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(completedTask[index].task),
        );
      },
    );
  }
}
