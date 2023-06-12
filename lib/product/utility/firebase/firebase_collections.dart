import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollection {
  users;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}
