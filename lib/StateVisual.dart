import 'package:pixi/pixi.dart';
import 'package:YearInReview/TimelineVisual.dart';
import 'package:YearInReview/LayoutConstants.dart';
import 'dart:math';

class State {
  DateTime _from;
  DateTime _to;
  String _description;
  String _private;
  Colour _colour;

  State(DateTime from, DateTime to, String description, String private, Colour colour) {
    _from = from;
    _to = to;
    _description = description;
    _private = private;
    _colour = colour;
  }

  DateTime get From => _from;
  DateTime get To => _to;
  String get Description => _description;
  String get Private => _private;
  Colour get StateColour => _colour;
  num get Days => _from.difference(_to).inDays;

  bool Contains(DateTime date) {
    return (_from.millisecondsSinceEpoch <= date.millisecondsSinceEpoch)
        && (_to.millisecondsSinceEpoch >= date.millisecondsSinceEpoch);
  }
}

class StateVisual {
  static final num height = 16;

  static final Colour StarLizard = new Colour.fromInt(0x195683);
  static final Colour Sabbatical = new Colour.fromInt(0x9E384E);
  static final Colour OneCog = new Colour.fromInt(0x5AC8FD);
  static final Colour Studying = new Colour.fromInt(0x859618);

  static final Colour Preparing = new Colour.fromInt(0xFBA30A);
  static final Colour Travelling = new Colour.fromInt(0xE67102);
  static final Colour Holiday = new Colour.fromInt(0xFFBF18);

  static final List<State> States = [
    new State(new DateTime(2016, 1, 1), new DateTime(2016, 1, 15), "StarLizard", "StarLizard", StarLizard),
    new State(new DateTime(2016, 1, 16), new DateTime(2016, 2, 5), "Sabbatical", "Sabbatical", Sabbatical),
    new State(new DateTime(2016, 2, 6), new DateTime(2016, 2, 14), "Holiday", "Snowboarding in Morzine", Holiday),
    new State(new DateTime(2016, 2, 15), new DateTime(2016, 3, 23), "Sabbatical", "Sabbatical", Sabbatical),
    new State(new DateTime(2016, 3, 24), new DateTime(2016, 3, 29), "Holiday", "Visiting Dad in Devon", Holiday),
    new State(new DateTime(2016, 3, 30), new DateTime(2016, 5, 20), "Preparing Van for European Tour", "Preparing Van", Preparing),
    new State(new DateTime(2016, 5, 21), new DateTime(2016, 7, 14), "Touring Europe in Camper Van", "Touring Europe in a camper van", Travelling),
    new State(new DateTime(2016, 7, 15), new DateTime(2016, 7, 17), "Holiday", "Visiting in-laws in Wirral", Holiday),
    new State(new DateTime(2016, 7, 18), new DateTime(2016, 8, 9), "Study", "Exam 357: Developing Mobile Apps", Studying),
    new State(new DateTime(2016, 8, 10), new DateTime(2016, 9, 16), "OneCog.Solutions", "OneCog Solutions", OneCog),
    new State(new DateTime(2016, 9, 17), new DateTime(2016, 9, 23), "Holiday", "Dad Visiting", Holiday),
    new State(new DateTime(2016, 9, 24), new DateTime(2016, 11, 2), "OneCog.Solutions", "OneCog Solutions", OneCog),
    new State(new DateTime(2016, 11, 3), new DateTime(2016, 11, 7), "Holiday", "Visiting Dublin, Ireland", Holiday),
    new State(new DateTime(2016, 11, 8), new DateTime(2016, 12, 21), "OneCog.Solutions", "OneCog Solutions", OneCog),
    new State(new DateTime(2016, 12, 22), new DateTime(2017, 1, 3), "Holiday", "Xmas and New Years", Holiday),
    new State(new DateTime(2017, 1, 4), new DateTime(2017, 1, 15), "OneCog.Solutions", "OneCog Solutions", OneCog),
  ];
  
  static final TextStyle LabelTextStyle = new TextStyle(font: "9pt Arial", fill: new Colour.fromInt(0x000000));

  TimelineVisual Initialize(DateTime startDate, num days) {   
    TimelineVisual timelineVisual = new TimelineVisual("State", (days * LayoutConstants.DayWidth), height + 4);

    DateTime currentDate = startDate;

    while (days > 0) {
      State state = States.firstWhere((s) => s.Contains(currentDate));
      num stateDays = min(days, state.To.difference(currentDate).inDays + 1);

      num left = currentDate.difference(startDate).inDays * LayoutConstants.DayWidth;
      num width = stateDays * LayoutConstants.DayWidth;

      DisplayObjectContainer container = new DisplayObjectContainer();

      Graphics graphics = new Graphics();
      graphics.beginFill(state.StateColour);
      graphics.drawRect(0, 0, width, height);
      graphics.endFill();
      container.children.add(graphics);

      CanvasText text = new CanvasText(state.Description, LabelTextStyle);
      text.position = new Point(2, 2);
      container.children.add(text);

      container.position = new Point(left + LayoutConstants.HorizontalMargin, 0);
      timelineVisual.children.add(container);

      days -= stateDays;
      currentDate = state.To.add(new Duration(days: 1));  
    }

    return timelineVisual;
  }
}