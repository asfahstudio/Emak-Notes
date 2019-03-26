import 'package:emak_notes/model_todo.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final DataTodo todo;

  DetailScreen({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.subtitle),
            ),
            Container(
              child: Text(todo.body),
            ),
          ],
        ),
      ),
    );
  }
}
