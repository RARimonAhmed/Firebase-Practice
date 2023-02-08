import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getData() async {
    var fireStore = FirebaseFirestore.instance;
    QuerySnapshot qn = await fireStore.collection("Countries").get();
    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Firebase Practice',
              style: TextStyle(color: Color.fromARGB(255, 222, 90, 248)),
            ),
          ),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: ((context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: ((context, index) {
                  DocumentSnapshot documentSnapshot = snapshot.data[index];
                  return Card(
                    child: ListTile(
                      title: Text(documentSnapshot["Name"]),
                    ),
                  );
                }));
          }),
        ),
      ),
    );
    // Center(
    // child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: const [
    //         Text(
    //           'Firebase Practice',
    //           style: TextStyle(
    //             color: Colors.amber,
    //             fontSize: 20,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
