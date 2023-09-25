import 'package:flutter/material.dart';
import 'package:todo/MyButton.dart';
import 'package:todo/MyButton.dart';


class dialogueBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;


  dialogueBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 245, 233, 122),
      content: Container(
        height: 120,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            //get a task
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Type your task here..."
              ),
            ),

            const SizedBox(height: 10),

            //2 buttos => save and cancel
            Row( 
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                  //save button
                  MyButton(
                    text: "Save", 
                    onPressed: onSave
                  ),

                  const SizedBox(width: 5),

                  //cancel button 
                  MyButton(
                    text: "Cancel", 
                    onPressed: onCancel
                  ),
                ],
            )
          ],
        ),
      ),
    );
  }
}