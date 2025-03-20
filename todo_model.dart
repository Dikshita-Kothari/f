class TodoModel {
  int? id;
  String title;
  int isDone; // 0 for not done, 1 for done

  TodoModel({this.id, required this.title, this.isDone = 0});

  factory TodoModel.fromMap(Map<String, dynamic> json) => TodoModel(
    id: json['id'],
    title: json['title'],
    isDone: json['isDone'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
    };
  }
}
