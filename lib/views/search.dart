import 'package:flutter/material.dart';
import 'package:messaging_app/widget/widget.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController seachTextEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: seachTextEditingController,
                decoration: InputDecoration(
                    hintText: "Search username...",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none),
              ),
            ),
            Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff007EF4),
                        const Color(0xff2A75BC),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                padding: EdgeInsets.all(10),
                child: Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
