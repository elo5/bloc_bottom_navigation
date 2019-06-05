import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatefulWidget {
  final int type;
  EmptyPage(this.type);
  @override
  _EmptyPageState createState() => new _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List colors = [Colors.white, Colors.greenAccent, Colors.grey, Colors.blueAccent];

    return new SafeArea(
        top: false,
        bottom: true,
        child:   Container(
          child:new Center(
            child: CircularProgressIndicator(),
          ),
          color: colors[widget.type],
        )
    );
  }
}

