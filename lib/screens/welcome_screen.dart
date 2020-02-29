import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WelcomeScreenStateful();
  }

}

class WelcomeScreenStateful extends StatefulWidget {
  @override
  _WelcomeScreenState createState() {
    return _WelcomeScreenState();
  }
}

class _WelcomeScreenState extends State<WelcomeScreenStateful> {
  String userName = "";
  final storage = FlutterSecureStorage();
  _WelcomeScreenState() {
     _getUserName().then((name) => setState(() {
        userName = name;
     }));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(child: Text('Welcome  ' + userName))
    );
  }

  Future<String> _getUserName() async {
    return await storage.read(key: 'user_name');
  }

}