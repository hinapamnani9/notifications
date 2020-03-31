import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),
        ),
        body: MyApp(),
      ),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void showSnackbar() {
    final snackbar = SnackBar(
      content: Text("Hi Snackbar here"),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void showBottom() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 100.0,
            color: Colors.orange,
            child: Center(
              child: Text("Bottom sheet Modal"),
            ),
          );
        });
  }

  Future<Null> showSimpleDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Simple Dialog"),
            content: Text("The Message you want"),
            actions: <Widget>[
              FlatButton(
                child: Text("Done"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: MaterialButton(
            child: Text("Snackbar"),
            color: Colors.red,
            textColor: Colors.white,
            splashColor: Colors.yellow,
            onPressed: () {
              showSnackbar();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: MaterialButton(
            child: Text("Modal bottom"),
            color: Colors.red,
            textColor: Colors.white,
            splashColor: Colors.yellow,
            onPressed: () {
              showBottom();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: MaterialButton(
            child: Text("Simple Dialog"),
            color: Colors.red,
            textColor: Colors.white,
            splashColor: Colors.yellow,
            onPressed: () {
              showSimpleDialog();
            },
          ),
        )
      ],
    );
  }
}
