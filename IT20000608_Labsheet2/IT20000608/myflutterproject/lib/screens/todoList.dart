import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myflutterproject/model/task.dart';
import 'package:myflutterproject/widgets/todoWidget.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final Stream<QuerySnapshot> stream = FirebaseFirestore.instance
      .collection("Todo")
      .snapshots(); //view data from firebase
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.brown),
      body: StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: (CircularProgressIndicator()));
          }
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> document =
                    snapshot.data?.docs[index].data() as Map<String, dynamic>;
                return Text(document["task"]);
              });
        },
      ),
    );
  }
}
