import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/Services/Auth.dart';
import 'package:messaging_app/Services/firebase.dart';
import 'package:messaging_app/home.dart';

final usersRef = FirebaseFirestore.instance.collection('users');

class Register extends StatefulWidget {
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  bool isLoading = false;
  bool _isObscure = true;
  final _key = GlobalKey<FormState>();

  final AuthenticationService auth = AuthenticationService();

  TextEditingController nameController = TextEditingController();
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Register',
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
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Name should not be empty';
                          } else
                            return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            )),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please put an email';
                          } else
                            return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        obscureText: _isObscure,
                        controller: passwordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password should not be empty';
                          } else
                            return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            labelStyle: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () async {
                                try {
                                  createUser();
                                  userSetup(
                                      nameController.text,
                                      emailController.text,
                                      passwordController.text);
                                } catch (e) {
                                  print(e.toString());
                                }
                              },
                              child: Text('Sign Up'))
                        ],
                      )
                    ],
                  )),
            ]),
          ),
        ),
      ),
    );
  }

  createUser() {
    if (_key.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      auth
          .signUpwithEmailAngPassword(
              emailController.text, passwordController.text)
          .then((val) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    }
  }
}
