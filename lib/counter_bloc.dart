import 'package:rxdart/rxdart.dart';

class CounterBloc {
  final _incrementLeftCount = BehaviorSubject<void>();
  Sink<void> get incrementLeftCount => _incrementLeftCount.sink;
  final _incrementRightCount = BehaviorSubject<void>();
  Sink<void> get incrementRightCount => _incrementRightCount.sink;
  final _incrementBothCount = BehaviorSubject<void>();
  Sink<void> get incrementBothCount => _incrementBothCount.sink;

  final _leftCount = BehaviorSubject<int>.seeded(0);
  ValueStream<int> get leftCount => _leftCount.stream;
  final _rightCount = BehaviorSubject<int>.seeded(0);
  ValueStream<int> get rightCount => _rightCount.stream;

  CounterBloc() {
    _incrementLeftCount.stream.listen((_) {
      _leftCount.sink.add(_leftCount.value + 1);
    });
    _incrementRightCount.stream.listen((_) {
      _rightCount.sink.add(_rightCount.value + 1);
    });
    _incrementBothCount.stream.listen((_) {
      _leftCount.sink.add(_leftCount.value + 1);
      _rightCount.sink.add(_rightCount.value + 1);
    });
  }

  void dispose() {
    _incrementLeftCount.close();
    _incrementRightCount.close();
    _incrementBothCount.close();
    _leftCount.close();
    _rightCount.close();
  }
}
