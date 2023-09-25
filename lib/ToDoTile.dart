import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final taskName;
  bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(), 
            children: [
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(8),
              )
            ],
          ),


          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color:  Colors.yellow, 
              borderRadius: BorderRadius.circular(8)),
            child:  Row(
              children: [
                //taskcompleted?
                Checkbox(
                  value: taskCompleted, 
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
        
                //taskname
                Text(
                  taskName,
                  style: TextStyle(
                    decoration: taskCompleted 
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
                ),
              ],
            ),
          ),
        ),
    );
  }
}