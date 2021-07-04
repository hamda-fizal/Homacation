import 'package:flutter/material.dart';
import 'package:hack_the_gap/login_fm.dart';
import 'package:hack_the_gap/login_hm.dart';
import 'package:provider/provider.dart';
import 'models/notify.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListListener>(
        create: (context) {
          return TaskListListener();
        },
        child: MaterialApp(
          home: HomePage(),
          theme: ThemeData(
              accentColor: Colors.deepPurple,
              primaryColor: Colors.deepPurpleAccent),
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              color: Colors.deepPurpleAccent,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                "Home Maker",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              padding: EdgeInsets.all(10),
              color: Colors.deepPurple,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPageFM()));
              },
              child: Text(
                "Family Member",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
