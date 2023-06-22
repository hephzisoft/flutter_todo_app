import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/add_todo.dart';
import '../models/todo_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final _allTaskList = Todo.allTask;
  

  String? greetingText;

  @override
  void initState() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      setState(() {
        greetingText = 'Good Morning';
      });
    } else if (hour >= 12 && hour <= 15) {
      setState(() {
        greetingText = 'Good Afternoon';
      });
    } else {
      setState(() {
        greetingText = "Good Evening";
      });
    }
    super.initState();
  }

  _startCreateNewTask() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddTask(_createNewTask);
        });
  }

  _createNewTask(String task) {
    final newTask = Todo(
        id: Todo.generateId(),
        task: task,
        dateAdded: DateTime.now(),
        isCompleted: false);
    setState(() {
      _allTaskList.add(newTask);
    });
  }

  _completedTask(int index) {
    setState(() {
      _allTaskList[index].isCompleted = !_allTaskList[index].isCompleted;
    });

    if (_allTaskList[index].isCompleted) {
      setState(() {
        _allTaskList.removeWhere((task) => task.id == _allTaskList[index].id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            backgroundImage: AssetImage('assets/images/pics.jpg'),
          ),
        ),
        title: Text(greetingText!),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.bell_fill),
              ),
              const Positioned(
                top: 1,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 13,
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('10'),
                  ),
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: _startCreateNewTask,
              icon: const Icon(CupertinoIcons.add))
        ],
      ),
      body: _allTaskList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Image.asset('assets/images/empty-task.png'),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: _startCreateNewTask,
                    child: const Text('Click here to add a new Task'),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    leading: IconButton(
                      icon: !_allTaskList[index].isCompleted
                          ? const Icon(Icons.check_box_outline_blank)
                          : const Icon(Icons.check_box),
                      onPressed: () => _completedTask(index),
                    ),
                    title: Text(_allTaskList[index].task),
                    trailing: IconButton(
                      icon: const Icon(CupertinoIcons.delete),
                      color: Theme.of(context).colorScheme.error,
                      onPressed: () {
                        print(_allTaskList[index].id);
                      },
                    ),
                  ),
                );
              },
              itemCount: _allTaskList.length,
            ),
    );
  }
}
