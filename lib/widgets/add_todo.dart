import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  AddTask(this.newTaskHandler, {Key? key}) : super(key: key);
  final taskController = TextEditingController();
  final Function newTaskHandler;

  @override
  Widget build(BuildContext context) {
    verifyHandler() {
      String enteredTask = taskController.text;

      if (enteredTask.isEmpty) {
        return;
      }
      newTaskHandler(enteredTask);
      Navigator.of(context).pop();
    }

    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        top: 10,
        bottom: 10,
        right: 15,
      ),
      child: Column(
        children: [
          Text(
            'Add Task',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextField(
            controller: taskController,
            onSubmitted: (_) => verifyHandler,
            decoration: const InputDecoration(
              hintText: 'Task',
              helperText: 'The task to be done should be added here',
            ),
            keyboardType: TextInputType.multiline,
          ),
          Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: verifyHandler, child: const Text('Add Task')))
        ],
      ),
    );
  }
}
