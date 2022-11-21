import 'package:flutter/material.dart';
import 'package:todo_list/constant/colors.dart';
import 'package:todo_list/models/todo.dart';
import '../Widget/todo_item.dart';
import '../constant/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    _searchTodo = todoList;
    // TODO: implement initState
    super.initState();
  }

  List<Todo> todoList = Todo.todoList(); //will get list of todo items
  final _todoController = TextEditingController();
  List<Todo> _searchTodo = [];

  void _inverChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  Widget searchBox() {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: tdGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        autofocus: false,
        onChanged: (value) => runfilter(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // logic for todo's searched in search box
  void runfilter(String text) {
    List<Todo> results = [];
    if (text.isEmpty) {
      // _searchTodo = todoList;
      // results = todoList;
      setState(() {
        _searchTodo = todoList;
      });
    } else {
      results = todoList
          .where((element) =>
              element.todotext.toLowerCase().contains(text.toLowerCase()))
          .toList();

      setState(() {
        _searchTodo = results;
      });
    }
  }

// this function remove item from todoList
  void _deleteTodoItem(String id) {
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }

//adding items to todo list
  void _addTodoItem(String text) {
    setState(() {
      todoList.add(
        Todo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            todotext: text),
      );
    });
    _todoController.clear();
  }

  //will display listview of todo list
  Widget ListViewExpanded() {
    return Expanded(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, bottom: 0, left: 15),
            child: const Text(
              "All ToDo",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const Divider(
            thickness: 3,
            color: tdblue,
          ),
          for (Todo todo1 in _searchTodo.reversed /*todolist.reversed*/)
            ToDoItem(
              todoo: todo1,
              onChange: _inverChange,
              onDelete: _deleteTodoItem,
            ),
        ],
      ),
    );
  }

  Widget BottomTextBox() {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 15,
              right: 15,
              left: 15,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: tdGrey,
                width: 3,
              ),
              color: tdGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            //text feild to add todo's
            child: TextField(
              controller: _todoController,
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                hintText: 'Add a new todo Item',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        AddButton(),
      ],
    );
  }

  // [ + ] button
  Widget AddButton() {
    return Container(
        padding: const EdgeInsets.only(bottom: 15, right: 10),
        child: ElevatedButton(
          onPressed: () {
            print('this was tapped');
            _addTodoItem(_todoController.text);
          },
          //botton style
          style: ElevatedButton.styleFrom(
            primary: tdblue,
            minimumSize: Size(60, 60),
            elevation: 10,
          ),
          child: const Text(
            '+',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ));
  }

  PreferredSizeWidget appBarSection() {
    return AppBar(
      backgroundColor: tdBlack,
      title: const Text(
        'ToDo App',
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      elevation: 0,
    );
  }

  Widget EmptyList() {
    return const Center(
      child: Text(
        "No ToDo's Yet!!!!!",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBlack,
      appBar: appBarSection(),
      body: Stack(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                searchBox(), //first search box to search available Todo's
                _searchTodo.isEmpty
                    ? EmptyList()
                    : ListViewExpanded(), //contains todos
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomTextBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
