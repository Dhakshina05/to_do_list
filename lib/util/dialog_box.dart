import 'package:flutter/material.dart';
import 'package:to_do_list/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller:controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),

            // buttons -> save + cancel
            Row(
              children: [
               //save button
               MyButton(
                text:"Save",
                 onPressed: (){
                  String task=controller.text.trim();
                  if(task.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Task cannot be empty"),
                        duration: Duration(seconds:2),
                        ),
                    );
                  return;
                 }
                 if (onSave != null)onSave!();
  },
                 ),

              const SizedBox(width:8),

               //cancel button
               MyButton(text: "Cancel", onPressed: onCancel),
           ],),
          ],
        ),
      ),
    );
  }
}
