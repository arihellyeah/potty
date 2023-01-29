import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PottymouthFirebaseUser {
  PottymouthFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

PottymouthFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PottymouthFirebaseUser> pottymouthFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<PottymouthFirebaseUser>(
      (user) {
        currentUser = PottymouthFirebaseUser(user);
        return currentUser!;
      },
    );
