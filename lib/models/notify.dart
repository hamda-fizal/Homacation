import 'package:flutter/material.dart';
import 'task.dart';
import 'family_members.dart';

class TaskListListener extends ChangeNotifier {
  List<Task> tasksList = [];
  List<FamilyMembers> memberList = [];
  List<String> memberNames = [];

  void addTask(String newTask) {
    tasksList.add(Task(taskName: newTask));
    notifyListeners();
  }

  void changeStatus(int i) {
    tasksList[i].isDone = !tasksList[i].isDone;
    notifyListeners();
  }

  void changeStatusString(int i) {
    tasksList[i].status = "Done";
    notifyListeners();
  }

  void addMember(String newMember) {
    memberList.add(FamilyMembers(name: newMember));
    memberNames.add(newMember);
    notifyListeners();
  }
}
