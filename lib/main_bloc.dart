import 'package:rxdart/rxdart.dart';
import 'package:bloc_bottom_navigation/bloc_provicer.dart';

class MainBloc implements BlocBase  {

  BehaviorSubject<int> _bottomTab = BehaviorSubject<int>();
  Sink<int> get _bottomTabSink => _bottomTab.sink;
  Stream<int> get bottomTabStream => _bottomTab.stream;
  void pickItem(int i) {
    _bottomTabSink.add(i);
  }

  MainBloc() {

  }

  @override
  void dispose() {
    _bottomTab.close();
  }
}
