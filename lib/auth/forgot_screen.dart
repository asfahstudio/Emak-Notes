import 'package:emak_notes/auth/register_screen.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  final Widget child;

  ForgotScreen({Key key, this.child}) : super(key: key);

  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 30, top: 120, right: 30, bottom: 20),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50,
                backgroundImage: AssetImage("assets/logo/logo.png"),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Email",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ButtonTheme(
                            buttonColor: Color(0xFF218C74),
                            height: 50,
                            splashColor: Color(0xFFffb142),
                            child: RaisedButton(
                              child: Text(
                                "SEND PASSWORD",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Color(0xFF218C74)),
                  ),
                  FlatButton(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          color: Color(0xFFffb142),
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
