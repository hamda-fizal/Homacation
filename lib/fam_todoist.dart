import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_the_gap/models/task.dart';
import 'package:provider/provider.dart';
import 'models/notify.dart';

class FamTodoist extends StatefulWidget {
  FamTodoist({Key key, this.title}) : super(key: key);
  final String title;

  @override
  FamTodoistState createState() => FamTodoistState();
}

class FamTodoistState extends State<FamTodoist> {
  // List<bool> selectedTasks = [];
  List<Task> tasks;
  String todoText;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.deepPurpleAccent,
          title: Row(
            children: <Widget>[
              Image.asset(
                "assets/homacationlogo.png",
                height: 40,
                width: 40,
              ),
              Text(" Homacation"),
            ],
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              Text(
                'To-do List',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.indigo,
                ),
              ),
              Expanded(
                child: new ListView.builder(
                  padding: EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  itemCount:
                      Provider.of<TaskListListener>(context).tasksList.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Column(
                      children: <Widget>[
                        new CheckboxListTile(
                            value: Provider.of<TaskListListener>(context)
                                .tasksList[i]
                                .isDone,
                            title: _strikeThrough(
                                todoText: Provider.of<TaskListListener>(context)
                                    .tasksList[i]
                                    .taskName,
                                checked: Provider.of<TaskListListener>(context)
                                    .tasksList[i]
                                    .isDone),
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (bool val) {
                              Provider.of<TaskListListener>(context,
                                      listen: false)
                                  .changeStatus(i);
                              Provider.of<TaskListListener>(context,
                                      listen: false)
                                  .changeStatusString(i);
                            })
                      ],
                    );
                  },
                ),
              ),
            ])));
  }
}

class _strikeThrough extends StatelessWidget {
  bool checked;
  String todoText;
  _strikeThrough({this.checked, this.todoText}) : super();

  Widget _strikewidget() {
    if (!checked) {
      return Text(
        todoText,
        style: TextStyle(
          fontSize: 22.0,
          color: Colors.teal[600],
        ),
      );
    } else {
      return Text(
        todoText,
        style: TextStyle(
            fontSize: 22.0,
            decoration: TextDecoration.lineThrough,
            color: Colors.blueGrey,
            fontStyle: FontStyle.italic),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _strikewidget();
  }
}
