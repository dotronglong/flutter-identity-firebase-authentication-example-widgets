import 'package:flutter/material.dart';
import 'package:identity/identity.dart';
import 'package:identity_firebase/identity_firebase.dart';
import 'package:sso/sso.dart';

import 'user_page.dart';

class HomePage extends StatefulWidget {
  final List<Authenticator> authenticators;

  HomePage({Key key, this.title, @required this.authenticators})
      : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void initState() {
    super.initState();

    Identity.of(context).init(FirebaseProvider(widget.authenticators),
        (context) => UserPage(user: Identity.instance.user));
  }
}
