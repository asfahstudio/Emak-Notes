import 'package:emak_notes/auth/login_screen.dart';
import 'package:emak_notes/model_todo.dart';
import 'package:emak_notes/detail_todo.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emak Notes',
      theme: ThemeData(
        primaryColor: Color(0xFF218C74),
      ),
      home: MyHomePage(title: 'Emak Notes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  List<DataTodo> listTodo = [
    DataTodo(
        title: "Ayam Kampungs 1 Kg",
        subtitle: "Minggu, 12 Juli",
        body: "Lorem Ipsum",
        circleIcon: circle(Colors.blue)),
    DataTodo(
        title: "Telor Onta 2 Kg",
        subtitle: "Minggu, 12 Juli",
        body: "Lorem Ipsum",
        circleIcon: circle(Colors.red)),
    DataTodo(
        title: "Micin 2 Saset",
        subtitle: "Minggu, 12 Juli",
        body: "Lorem Ipsum",
        circleIcon: circle(Colors.green)),
  ];

  List<DataTodo> listHistory = [];

  static Widget circle(warna) {
    return Container(
      width: 30,
      height: 30,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(100), color: warna),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emak Notes"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.input),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              text: "To-Do",
              icon: Icon(Icons.add),
            ),
            Tab(
              text: "History",
              icon: Icon(Icons.history),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          // Halaman To-Do
          Container(
            child: ListView.builder(
              itemCount: listTodo.length,
              itemBuilder: (context, posisi) {
                var dataTodo = listTodo.elementAt(posisi);
                return Card(
                  margin: EdgeInsets.all(1),
                  child: ListTile(
                    leading: dataTodo.circleIcon,
                    title: Text(dataTodo.title),
                    subtitle: Text(dataTodo.subtitle),
                    trailing: FlatButton(
                      splashColor: Color(0xFFffb142),
                      child: Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        setState(() {
                          listHistory.add(dataTodo);
                          listTodo.removeAt(posisi);
                        });
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(todo: listTodo[posisi]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          // Halaman History
          Container(
            child: ListView.builder(
              itemCount: listHistory.length,
              itemBuilder: (context, posisi) {
                var dataHistory = listHistory.elementAt(posisi);
                return ListTile(
                  leading: dataHistory.circleIcon,
                  title: Text(dataHistory.title),
                  subtitle: Text(dataHistory.title),
                  trailing: FlatButton(
                    splashColor: Color(0xFFffb142),
                    child: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      setState(() {
                        listTodo.add(dataHistory);
                        listHistory.removeAt(posisi);
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(todo: listHistory[posisi]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("object");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
