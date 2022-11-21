class Todo {
  String id;
  String todotext;
  bool isDone;

  Todo({
    required this.id,
    required this.todotext,
    this.isDone = false,
  });

  static List<Todo> todoList() {
    return [
      // sample Todo List
      // Todo(id: '01', todotext: 'Morning Exercise', isDone: true),
      // Todo(id: '02', todotext: 'Buy Grocerires', isDone: true),
      // Todo(id: '03', todotext: 'Team Meating', isDone: true),
    ];
  }
}
