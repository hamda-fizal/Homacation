import 'package:flutter/material.dart';
import 'package:hack_the_gap/assign_task.dart';
import 'models/family_members.dart';
import 'package:provider/provider.dart';
import 'models/notify.dart';

class AddFamilyMember extends StatefulWidget {
  @override
  _AddFamilyMemberState createState() => _AddFamilyMemberState();
}

class _AddFamilyMemberState extends State<AddFamilyMember> {
  List<FamilyMembers> memberList = [];
  String newMember;
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AssignTask()));
                },
                child: Text('Next'),
              ),
            ),
            Container(
              child: Text(
                "Family Members",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount:
                      Provider.of<TaskListListener>(context).memberList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        '${index + 1}. ${Provider.of<TaskListListener>(context).memberList[index].name}',
                        style: TextStyle(fontSize: 18),
                      ),
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
                newMember = null;
                return Container(
                  height: 200,
                  color: Color(0xff757575),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Add Member',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24),
                        ),
                        TextField(
                          autofocus: true,
                          textAlign: TextAlign.center,
                          onChanged: (val) {
                            newMember = val;
                          },
                        ),
                        FlatButton(
                          color: Colors.deepPurple,
                          onPressed: () {
                            if (newMember != null)
                              Provider.of<TaskListListener>(context,
                                      listen: false)
                                  .addMember(newMember);
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Add Member',
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
