import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

String? uid;
String? userEmail;

Future<User?> registerWithEmailPassword(String email, String password) async{
  //Initialize Firebase
  await Firebase.initializeApp();
  User? user;

  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
    );

    user = userCredential.user;

    if(user != null){
      uid = user.uid;
      userEmail = user.email;
    }
  } catch (e) {
    print(e);
  }
  return user;
}