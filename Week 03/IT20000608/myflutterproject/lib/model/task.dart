class Task {
  String? id;
  String? text;
  bool state;

  Task({
    required this.id,
    required this.text,
    this.state = false,
  });

  static List<Task> todoList() {
    return [
      Task(id: "1", text: "Sample task 1", state: true),
      Task(id: "2", text: "Sample task 2", state: false),
    ];
  }
}
