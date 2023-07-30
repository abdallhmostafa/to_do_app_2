import 'package:flutter/material.dart';
import 'package:to_do_app_2/widgets/addTask.dart';
import 'package:to_do_app_2/widgets/task_model.dart';
import 'package:to_do_app_2/widgets/to_do_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var formController = TextEditingController();

  changeStatus(int counter) {
    setState(() {
      allTask[counter].status = !allTask[counter].status;
    });
  }

  deleteAllTask() {
    setState(() {
      allTask.removeRange(0, allTask.length);
    });
  }

  deleteTask(int index) {
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

  AddTask addTask = AddTask();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  allTask.clear();
                });
              },
              icon: const Icon(
                Icons.delete_forever,
                size: 30.0,
                color: Colors.white,
              ))
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
                color: allTask.length == checkedTask()
                    ? Colors.green
                    : Colors.white,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 500.0,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: allTask.length,
                itemBuilder: (context, index) {
                  return ToDoCard(
                    title: allTask[index].title,
                    check: allTask[index].status,
                    changeStatus: changeStatus,
                    deleteTask: deleteTask,
                    index: index,
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTask.addTask(context,
              formController: formController, addNewTask: addNewTask);
        },
        backgroundColor: const Color.fromRGBO(62, 70, 90, 0.9),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
