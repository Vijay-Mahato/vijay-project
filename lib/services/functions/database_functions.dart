// Create Database

import 'package:cloud_firestore/cloud_firestore.dart';

create(
    String collName, String docName, String name, int age, int rollNo) async {
  await FirebaseFirestore.instance
      .collection(collName)
      .doc(docName)
      .set({"Name": name, "Age": age, "Roll No": rollNo});

  print("Database Created Successfully.................... ");
}

// Update Database

update(String collName, String docName, String field, var newfield) async {
  await FirebaseFirestore.instance
      .collection(collName)
      .doc(docName)
      .update({field: newfield});

  print("Update Database Successfully...................");
}

// Delete Database

delete(String collName, String docName) async {
  await FirebaseFirestore.instance.collection(collName).doc(docName).delete();

  print("Database deleted successfully........................");
}
