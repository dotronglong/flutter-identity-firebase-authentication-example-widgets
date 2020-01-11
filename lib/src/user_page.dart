import 'package:flutter/material.dart';
import 'package:identity/identity.dart';
import 'package:sso/sso.dart';

class UserPage extends StatelessWidget {
  final User user;

  const UserPage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Page"),
        actions: <Widget>[
          IconButton(
              onPressed: () => Identity.of(context).user = null,
              icon: Icon(Icons.close))
        ],
      ),
      body: Container(
        color: Colors.blueAccent,
        padding: EdgeInsets.all(16),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: label(user.id),
                  subtitle: Text("ID"),
                ),
                ListTile(
                  title: label(user.email),
                  subtitle: Text("Email"),
                ),
                ListTile(
                  title: yesNo(user.isVerified),
                  subtitle: Text("Is Verified"),
                ),
                ListTile(
                  title: yesNo(user.isEnabled),
                  subtitle: Text("Is Enabled"),
                ),
                ListTile(
                  title: label(user.token.substring(0, 100) + "[...]"),
                  subtitle: Text("Token"),
                ),
                ListTile(
                  title: label(
                      user.expiredAt.difference(DateTime.now()).toString()),
                  subtitle: Text("Expiration In"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget label(String text) {
    return Text(text, style: TextStyle(fontSize: 16));
  }

  Widget yesNo(bool value) {
    return label(value ? "YES" : "NO");
  }
}
