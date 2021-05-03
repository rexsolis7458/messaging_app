import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference userList =
      Firestore.instance.collection('userInfo');

  Future<void> createUserData(String userName, String uid) async {
    return await userList.document(uid).setData({
      'userName': userName,
    });
  }

  Future updateUserList(String userName, String uid) async {
    return await userList.document(uid).updateData({
      'userName': userName,
    });
  }

  Future getUserList() async {
    List itemsList = [];

    try {
      await userList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
