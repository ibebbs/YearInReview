import 'package:pixi/pixi.dart';

class TimelineVisual extends DisplayObjectContainer {
  String _name;
  num _width;
  num _height;

  TimelineVisual(String name, num width, num height) {
    _name = name;
    _width = width;
    _height = height;
  }

  String get Name => _name;
  num get Width => _width;
  num get Height => _height;
}