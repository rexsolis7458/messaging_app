import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/Services/Auth.dart';
import 'package:messaging_app/home.dart';
import 'package:messaging_app/register/register.dart';
import 'package:messaging_app/chatroom/chat.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final _key = GlobalKey<FormState>();

  final AuthenticationService auth = AuthenticationService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.blue[200],
            child: Center(
                child: Form(
                    key: _key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              children: [
                                SizedBox(height: 30),
                                TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Email cannot be empty';
                                    } else
                                      return null;
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle:
                                          TextStyle(color: Colors.white)),
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: 30),
                                TextFormField(
                                    controller: passwordController,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Password cannot be empty';
                                      } else
                                        return null;
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle:
                                            TextStyle(color: Colors.white)),
                                    style: TextStyle(color: Colors.white)),
                                SizedBox(height: 5),
                                ElevatedButton(
                                  child:
                                      Text('Not registerd yet? Sign up here'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(CupertinoPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) => Register(),
                                    ));
                                  },
                                ),
                                SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        child: Text('LOGIN'),
                                        onPressed: () {
                                          if (_key.currentState.validate()) {
                                            signInUser();
                                          }
                                        }),
                                  ],
                                )
                              ],
                            ))
                      ],
                    )))));
  }

  void signInUser() async {
    dynamic authResult = await auth.signInWithEmailAndPassword(
        emailController.text, passwordController.text);
    if (authResult == null) {
      print('Sign in error. Could not be able to login');
    } else {
      emailController.clear();
      passwordController.clear();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ChatRoom()));
    }
  }
}
