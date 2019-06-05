import 'package:flutter/material.dart';
import 'package:bloc_bottom_navigation/main_bloc.dart';
import 'package:bloc_bottom_navigation/bloc_provicer.dart';
import 'main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Click the button to show MainPage',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ((){

          Navigator.push(
              context,
              new MaterialPageRoute<void>(
                  builder: (ctx) => new BlocProvider<MainBloc>(
                    child: MainPage(),
                    bloc: new MainBloc(),
                  )));
        }),
        tooltip: 'go to main page',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
