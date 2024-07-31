import 'package:flutter/material.dart';
import 'package:vijay/services/functions/database_functions.dart';

class PractisePage1 extends StatelessWidget {
  const PractisePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
        title: Text(
          "Database Option",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      create("Srinath University", "Bca", "Aryan", 20, 28);
                    },
                    child: Text("Create")),
                ElevatedButton(onPressed: () {}, child: Text("Retrive")),
                ElevatedButton(
                    onPressed: () {
                      update("Arka Jain University", "Diploma", "Age", 34);
                      update("Srinath University", "Bca", "Name", "Vikash");
                      update("Srinath University", "Bca", "Name", "Shalu");
                    },
                    child: Text("Update")),
                ElevatedButton(
                    onPressed: () {
                      delete("Arka Jain University", "Diploma");
                    },
                    child: Text("Delete"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
