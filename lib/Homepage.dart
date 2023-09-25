import 'package:flutter/material.dart';
import 'ToDoTile.dart';
import 'dialogueBox.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  
  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  //text controller
  final _controller = TextEditingController();
  
  //list of todo tasks 
  List toDoList = [
    ["PCE Exp 9", false],
  ];

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }


  //save new task 
  void saveNewTask() {
      setState(() {
        toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
  }

  //create new task
  void createNewTask() {
    showDialog(context: context, builder: (context) {
        return dialogueBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
    });
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 236, 136),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ToDo"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0], 
            taskCompleted: toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
