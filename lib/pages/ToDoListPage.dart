import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Depedensi untuk menyimpan data byte kecil ke memori internal untuk sementara

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final TextEditingController _textFieldController = TextEditingController();
  List<String> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> loadedTasks = prefs.getStringList('tasks') ?? [];
    print('Loaded tasks: $loadedTasks'); // Log untuk debugging
    setState(() {
      tasks = loadedTasks;
    });
  }

  void _saveTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('tasks', tasks);
    print('Saved tasks: $tasks'); // Log untuk debugging
  }

  void _addTask(String task) {
    if (task.isNotEmpty) {
      setState(() {
        tasks.add(task);
        _textFieldController.clear();
      });
      _saveTasks();
    }
  }

  void _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
    _saveTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _displayDialog(context),
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(
                    context); // Mempertahankan Inputan Data List agar tetap ada
              },
            ),
            Spacer(),
            Text(
              'Aplikasi To Do List',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      body: tasks.isEmpty
          ? Center(
              child: Text(
                'No tasks yet, add some!',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(tasks[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeTask(index),
                    ),
                  ),
                );
              },
            ),
    );
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add a new task'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Enter task here"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('ADD'),
              onPressed: () {
                _addTask(_textFieldController
                    .text); // Fungsi dari Share Prefrences agar menjaga data inputan
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
