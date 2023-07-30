import 'package:flutter/material.dart';
class AddTask {
 
  
  
  void addTask(BuildContext context,{required TextEditingController formController,required Function addNewTask}) {
    showDialog(
      builder: (BuildContext _) => Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          height: 200.0,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          color: const Color.fromRGBO(62, 70, 90, 0.9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: formController,
                maxLength: 30,
                style: const TextStyle(
                  color: Colors.white,
                ),
                keyboardType: TextInputType.text,
                autocorrect: true,
                autofocus: true,
                textInputAction: TextInputAction.done,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    iconColor: Colors.white,
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    labelText: "Enter your Task",
                    prefixIcon: Icon(
                      Icons.lightbulb_sharp,
                    ),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                  onPressed: () {
                    addNewTask();
                    formController.text = "";
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900),
                  )),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
      context: context,
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
