import 'package:flutter/material.dart';
import 'package:messaging_app/helper/authenticate.dart';
//import 'views/signin.dart';
// import 'views/signUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color(0xff145C9E),
          scaffoldBackgroundColor: Color(0xff1F1F1F)),
      debugShowCheckedModeBanner: false,
      home: Authenticate(),
    );
  }
}
