import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class Database {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _create() async {
    try {
      await firestore.collection('users').doc('testUser').set({
        'firstName': 'John',
        'lastName': 'Peter',
      });
    } catch (e) {
      print(e);
    }
  }
 /*
  void _read() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot =
      await firestore.collection('users').doc('testUser').get();
      print(documentSnapshot.data);
    } catch (e) {
      print(e);
    }
  }
*/


  void _read( String img1, String img2, String img3, String img4, String aud, ) async {// read function, currently reads all data
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot documentSnapshot;
    try {
      await for (var snapshot in firestore.collection('data').snapshots()) {
        for (var message in snapshot.docs) {
          //  if (message.id.toString() == '1'||message.id.toString() == '2'||message.id.toString() == '3'){//if statement to select relevant decks
          // print(message.id.toString());
          // print(message.data());
          if (message.id.toString() == '2'){
            print(message.id.toString());
            aud= message.data()['audio'];
            img1= message.data()['card1'];
            img2= message.data()['card2'];
            img3= message.data()['card3'];
            img4= message.data()['card4'];
            print(img1);

          }
          //print(message.data()['audio']); - use this to get the audio file, and replace with card1, card2, etcetc
        }
        //}//if statement to select relevant decks
      }

    } catch (e) {
      print(e);
    }
  }

}