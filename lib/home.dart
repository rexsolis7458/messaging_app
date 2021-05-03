import 'package:flutter/material.dart';
import 'package:messaging_app/register/register.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Message App'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: <Widget>[
            Center(
                heightFactor: 2,
                child: Image.asset(
                  'images/messenger.png',
                  height: 200,
                  width: 200,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Register();
                    },
                    child: Text('SIGN UP'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text('LOGIN'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    )),
              ],
            )
          ],
        ));
  }
}
