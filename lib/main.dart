import 'package:flutter/material.dart';

import 'widgets/to_do_card.dart';

void main() {
  runApp(const MyApp());
}

class Task {
  String title;
  bool status;

  Task({required this.title, required this.status});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoApp2(),
    );
  }
}

List allTask = [
  Task(title: "Sleep", status: true),
  Task(title: "Go to Gym", status: true),
  Task(title: "Take a Shower", status: true),
];


class ToDoApp2 extends StatefulWidget {
  const ToDoApp2({Key? key}) : super(key: key);

  @override
  State<ToDoApp2> createState() => _ToDoApp2State();
}

class _ToDoApp2State extends State<ToDoApp2> {
  var formController = TextEditingController();

  changeStatus(int counter){
    setState(() {
      allTask[counter].status=!  allTask[counter].status;
    });
  }
  deleteAllTask(){
    setState(() {
      allTask.removeRange(0, allTask.length);
    });
  }
  deleteTask(int index){
    setState(() {
      allTask.removeAt(index);
    });
  }
  void addNewTask() {
    setState(() {
      allTask.add(Task(title: formController.text, status: false));
    });
  }

  int checkedTask() {
    int counter = 0;
    for (var element in allTask) {
      if (element.status) counter++;
    }
    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
            IconButton(onPressed: (){setState(() {
              allTask.clear();
            });}, icon:const Icon(Icons.delete_forever,size: 30.0,color: Colors.white,))
        ],
        backgroundColor: const Color.fromRGBO(58, 66, 86, 0.9),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "To Do App",
          style: TextStyle(
              fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          children: [
            Text(
              "${checkedTask()} / ${allTask.length}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: allTask.length==checkedTask()?  Colors.green: Colors.white,
              ),
            ),
            const SizedBox( height: 10.0,  ),
            SizedBox(
              height: 500.0,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: allTask.length,
                itemBuilder:(context, index) {
                return ToDoCard(title: allTask[index].title,check: allTask[index].status,changeStatus: changeStatus,deleteTask: deleteTask,index: index,);
              },

              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {showDialog(builder: (BuildContext _) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
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
            ), context: context,);},
        backgroundColor: const Color.fromRGBO(62, 70, 90, 0.9),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
