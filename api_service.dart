import 'dart:convert';
import 'package:http/http.dart' as http;
import 'todo_model.dart';

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/todos";

  Future<List<TodoModel>> getTasks() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => TodoModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load tasks");
    }
  }

  Future<TodoModel> addTask(String title) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"title": title, "completed": false}),
    );
    if (response.statusCode == 201) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to add task");
    }
  }

  Future<void> updateTask(int id, String newTitle) async {
    await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"title": newTitle, "completed": false}),
    );
  }

  Future<void> deleteTask(int id) async {
    await http.delete(Uri.parse("$baseUrl/$id"));
  }
}
