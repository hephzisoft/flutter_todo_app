import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask(this.completedTask, {super.key});

  final List<Todo> completedTask;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: SizedBox(
                height: constraints.maxHeight * 0.1,
                child: Text(
                  'Completed Task',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.80,
              child: ListView.builder(
                itemCount: completedTask.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(completedTask[index].task),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
