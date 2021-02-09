
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_tracker_app/Models/projecttracker.dart';
import 'package:project_tracker_app/Services/database.dart';
class projectTrackerCard extends StatefulWidget {
  final ProjectTrackerModel projecttracker;
  final FirebaseFirestore firestore;
  final String uid;

  const projectTrackerCard({Key key, this.projecttracker, this.firestore, this.uid})
      : super(key: key);

  @override
  _projectTrackerCardState createState() => _projectTrackerCardState();
}

class _projectTrackerCardState extends State<projectTrackerCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.projecttracker.projectName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Checkbox(
              value: widget.projecttracker.projectStatus,
              onChanged: (newValue) {
                setState(() {});
                Database(firestore: widget.firestore).updateTodo(
                  uid: widget.uid,
                  projectID: widget.projecttracker.projectID,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}