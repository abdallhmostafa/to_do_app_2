import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final String title;
  final int index;
  final bool check;
  final Function changeStatus;
  final Function deleteTask;

  const ToDoCard(
      {super.key,
      required this.title,
      required this.check,
      required this.changeStatus,
      required this.deleteTask,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
       child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(62, 70, 90, 0.9),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style:  TextStyle(
                color:check? Colors.green: Colors.white,
                fontSize: 25.0,
                fontWeight:check? FontWeight.w700:FontWeight.normal
              ),
            ),
         Row(
           children: [
             Icon(check ? Icons.check : Icons.close,
                 color: check ? Colors.green : Colors.red, size: 30.0),
             IconButton(onPressed: ()=>deleteTask(index), icon:const Icon(Icons.delete,size: 30.0,color: Colors.white,))

           ],
         )
          ],
        ),
      ),
    );
  }
}
