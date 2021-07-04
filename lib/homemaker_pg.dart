import 'package:flutter/material.dart';
import 'package:hack_the_gap/add_fam_member.dart';
import 'models/notify.dart';
import 'package:provider/provider.dart';

class HomeMaker extends StatefulWidget {
  @override
  _HomeMakerState createState() => _HomeMakerState();
}

class _HomeMakerState extends State<HomeMaker> {
  //List<Task> taskList = [];
  String newTaskName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 40),
        //margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddFamilyMember()));
                },
                child: Text('Next'),
              ),
            ),
            Container(
              child: Text(
                "My Task",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount:
                      Provider.of<TaskListListener>(context).tasksList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(Provider.of<TaskListListener>(context)
                              .tasksList[index]
                              .taskName)),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                newTaskName = null;
                return Container(
                  height: 200,
                  color: Color(0xff757575),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Add Task',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24),
                        ),
                        TextField(
                          autofocus: true,
                          textAlign: TextAlign.center,
                          onChanged: (val) {
                            newTaskName = val;
                          },
                        ),
                        FlatButton(
                          color: Colors.deepPurple,
                          onPressed: () {
                            if (newTaskName != null)
                              Provider.of<TaskListListener>(context,
                                      listen: false)
                                  .addTask(newTaskName);

                            //print(taskList[0].taskName);
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Add Task',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                );
              },
              isScrollControlled: true);
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
