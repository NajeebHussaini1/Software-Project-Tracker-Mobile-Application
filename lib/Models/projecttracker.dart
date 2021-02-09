import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectTrackerModel{
  String projectID;
  String projectName;
  String projectBudget;
  String projectDuration;
  bool projectStatus;

  ProjectTrackerModel({
    this.projectID,
    this.projectName,
    this.projectBudget,
    this.projectDuration,
    this.projectStatus,
    });
    ProjectTrackerModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
      projectID = documentSnapshot.id;
      projectName = documentSnapshot.data()['projectName'] as String;
      projectBudget = documentSnapshot.data()['projectBudget'] as String;
      projectDuration = documentSnapshot.data()['projectDuration'] as String;
      projectStatus = documentSnapshot.data()['projectStatus'] as bool;
    }
}