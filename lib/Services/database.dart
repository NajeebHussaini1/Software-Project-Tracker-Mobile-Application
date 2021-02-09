import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_tracker_app/Models/projecttracker.dart';


class Database {
  final FirebaseFirestore firestore;

  Database({this.firestore});

  Stream<List<ProjectTrackerModel>> streamProjectTracker({String uid}) {
    try {
      return firestore
          .collection("ProjectTracker")
          .doc(uid)
          .collection("ProjectTracker")
          .where("projectStatus", isEqualTo: true)
          .snapshots()
          .map((query) {
        final List<ProjectTrackerModel> retVal = <ProjectTrackerModel>[];
        for (final DocumentSnapshot doc in query.docs) {
          retVal.add(ProjectTrackerModel.fromDocumentSnapshot(documentSnapshot: doc));
        }
        return retVal;
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addTodo({String uid, String projectName, String projectBudget, String projectDuration}) async {
    try {
      firestore.collection("ProjectTracker").doc(uid).collection("ProjectTracker").add({
        "projectName": projectName,
        "projectBudget": projectBudget,
        "projectDuration": projectDuration,
        "projectStatus": false,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateTodo({String uid, String projectID}) async {
    try {
      firestore
          .collection("ProjectTracker")
          .doc(uid)
          .collection("ProjectTracker")
          .doc(projectID)
          .update({
        "projectStatus": false,
      });
    } catch (e) {
      rethrow;
    }
  }
}