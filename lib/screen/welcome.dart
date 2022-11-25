import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:loginsystem/screen/home.dart';

class WelcomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ยินดีต้อนรับเข้าสู่ระบบ")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(
                auth.currentUser!.email.toString(),
                style: TextStyle(fontSize: 25),
              ),
              ElevatedButton(
                  onPressed: (() {
                    auth.signOut().then((value) {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: ((context) {
                          return HomeScreen();
                        }),
                      ));
                    });
                  }),
                  child: Text("ออกจากระบบ"))
            ],
          ),
        ),
      ),
    );
  }
}
