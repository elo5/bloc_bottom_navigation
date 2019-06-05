import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc_bottom_navigation/empty_page.dart';
import 'my_bottom_navigation_bar.dart';
import 'package:bloc_bottom_navigation/main_bloc.dart';
import 'package:bloc_bottom_navigation/bloc_provicer.dart';
import 'styles.dart';

final pages = [
  EmptyPage(0),
  EmptyPage(1),
  EmptyPage(2),
  EmptyPage(3),
];

class MainPage extends StatefulWidget {
  createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainBloc _bottomNavBarBloc;

  static final TAB_SIZE = 24.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bottomNavBarBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bottomNavBarBloc = BlocProvider.of<MainBloc>(context);

    return Scaffold(
      body: StreamBuilder<int>(
        stream: _bottomNavBarBloc.bottomTabStream,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return IndexedStack(
            index: snapshot.data,
            children: pages,
          );
        },
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.bottomTabStream,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return MyBottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: ((index) {
              _bottomNavBarBloc.pickItem(index);
            }),
            currentIndex: snapshot.data,
            items: [
              BottomNavigationBarItem(
                title: Text(
                  'TAB0',
                  style: snapshot.data == 0
                      ? TextStyles.TAB_SELECTED
                      : TextStyles.TAB_DISSELECTED,
                ),
                icon: Icon(
                  Icons.home,
                  size: TAB_SIZE,
                  color: snapshot.data == 0
                      ? Color(0xFFE53935)
                      : Color(0xff000000),
                ),
              ),
              BottomNavigationBarItem(
                title: Text(
                  'TAB1',
                  style: snapshot.data == 1
                      ? TextStyles.TAB_SELECTED
                      : TextStyles.TAB_DISSELECTED,
                ),
                icon: Icon(
                  Icons.message,
                  size: TAB_SIZE,
                  color: snapshot.data == 1
                      ? Color(0xFFE53935)
                      : Color(0xff000000),
                ),
              ),
              BottomNavigationBarItem(
                title: Text(
                  'TAB2',
                  style: snapshot.data == 2
                      ? TextStyles.TAB_SELECTED
                      : TextStyles.TAB_DISSELECTED,
                ),
                icon: Icon(
                  Icons.backup,
                  size: TAB_SIZE,
                  color: snapshot.data == 2
                      ? Color(0xFFE53935)
                      : Color(0xff000000),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              BottomNavigationBarItem(
                title: Text(
                  'TAB3',
                  style: snapshot.data == 3
                      ? TextStyles.TAB_SELECTED
                      : TextStyles.TAB_DISSELECTED,
                ),
                icon: Icon(
                  Icons.calendar_today,
                  size: TAB_SIZE,
                  color: snapshot.data == 3
                      ? Color(0xFFE53935)
                      : Color(0xff000000),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              )
            ],
          );
        },
      ),
    );
  }
}
