import 'package:pixi/pixi.dart';
import 'package:YearInReview/TimelineVisual.dart';
import 'package:YearInReview/LayoutConstants.dart';
import 'dart:html';
import 'dart:math';

class Reputation {
  DateTime _date;
  double _value;

  Reputation (DateTime date, num value) {
    _date = date;
    _value = value;
  }

  DateTime get Date => _date;
  num get Value => _value;
}

class StackOverflowVisual {
  static final num height = 16;
  static final Colour totalColour = new Colour.fromHtml("#5AC8FD");
  static final Colour repColour = new Colour.fromHtml("#195683");

  static final List<Reputation> reputations = [
    new Reputation(DateTime.parse("2016-08-23"), 20),
    new Reputation(DateTime.parse("2016-08-24"), 25),
    new Reputation(DateTime.parse("2016-08-26"), 8),
    new Reputation(DateTime.parse("2016-08-31"), 10),
    new Reputation(DateTime.parse("2016-09-03"), 48),
    new Reputation(DateTime.parse("2016-09-04"), 72),
    new Reputation(DateTime.parse("2016-09-05"), 35),
    new Reputation(DateTime.parse("2016-09-06"), 108),
    new Reputation(DateTime.parse("2016-09-07"), 30),
    new Reputation(DateTime.parse("2016-09-08"), 25),
    new Reputation(DateTime.parse("2016-09-14"), 10),
    new Reputation(DateTime.parse("2016-09-15"), 15),
    new Reputation(DateTime.parse("2016-09-17"), 10),
    new Reputation(DateTime.parse("2016-09-18"), 10),
    new Reputation(DateTime.parse("2016-09-30"), 15),
    new Reputation(DateTime.parse("2016-10-12"), 35),
    new Reputation(DateTime.parse("2016-10-14"), 25),
    new Reputation(DateTime.parse("2016-10-17"), 20),
    new Reputation(DateTime.parse("2016-10-21"), 25),
    new Reputation(DateTime.parse("2016-10-22"), 15),
    new Reputation(DateTime.parse("2016-10-23"), 10),
    new Reputation(DateTime.parse("2016-10-24"), 10),
    new Reputation(DateTime.parse("2016-10-25"), 40),
    new Reputation(DateTime.parse("2016-10-26"), 5),
    new Reputation(DateTime.parse("2016-10-27"), 10),
    new Reputation(DateTime.parse("2016-10-28"), 25),
    new Reputation(DateTime.parse("2016-10-29"), 25),
    new Reputation(DateTime.parse("2016-11-01"), 10),
    new Reputation(DateTime.parse("2016-11-05"), 25),
    new Reputation(DateTime.parse("2016-11-06"), 10),
    new Reputation(DateTime.parse("2016-11-08"), 10),
    new Reputation(DateTime.parse("2016-11-09"), 115),
    new Reputation(DateTime.parse("2016-11-10"), 35),
    new Reputation(DateTime.parse("2016-11-11"), 45),
    new Reputation(DateTime.parse("2016-11-12"), -1),
    new Reputation(DateTime.parse("2016-11-13"), 25),
    new Reputation(DateTime.parse("2016-11-14"), 65),
    new Reputation(DateTime.parse("2016-11-15"), 35),
    new Reputation(DateTime.parse("2016-11-16"), 45),
    new Reputation(DateTime.parse("2016-11-17"), 10),
    new Reputation(DateTime.parse("2016-11-19"), 35),
    new Reputation(DateTime.parse("2016-11-21"), 25),
    new Reputation(DateTime.parse("2016-12-14"), -35),
    new Reputation(DateTime.parse("2016-12-21"), -1),
    new Reputation(DateTime.parse("2017-01-08"), 15),
    new Reputation(DateTime.parse("2017-01-17"), 20),
    new Reputation(DateTime.parse("2017-01-19"), 23),
    new Reputation(DateTime.parse("2017-01-20"), 30),
    new Reputation(DateTime.parse("2017-01-23"), 10),
  ];

  TimelineVisual Initialize(DateTime startDate, num days) {  
    TimelineVisual timelineVisual = new TimelineVisual("StackOverflow", (days * LayoutConstants.DayWidth), height + 4);

    Graphics graphics = new Graphics();
    graphics.position = new Point(LayoutConstants.HorizontalMargin, 0);

    DateTime maxDate = startDate.add(new Duration(days: days + 1));

    List<Reputation> range = reputations
        .where((p) => p.Date.isAfter(startDate) && p.Date.isBefore(maxDate))
        .toList();
        
    num max = range.fold(0, (t,r) => r.Value > t ? r.Value : t);
        
    graphics.beginFill(repColour, 0.3);

    range
      .forEach((r) => graphics.drawRect(r.Date.difference(startDate).inDays * LayoutConstants.DayWidth + 1, height, LayoutConstants.DayWidth - 1, 0 - ((r.Value / max) * height)));

    graphics.endFill();

    graphics.lineStyle(2, totalColour, 1.0);
    max = range.fold(0, (t,r) => t += r.Value);

    num y = height;
    num x = reputations.first.Date.difference(startDate).inDays * LayoutConstants.DayWidth;
    num total = 0;
    
    graphics.moveTo(0, y);
    graphics.lineTo(x, y);

    for (int i = 0; i < range.length; i++) {
      total += range[i].Value;

      y = height - ((total / max) * height);
      x = (range[i].Date.difference(startDate).inDays + 1) * LayoutConstants.DayWidth;

      graphics.lineTo(x, y);
    }

    graphics.lineTo((maxDate.difference(startDate).inDays - 1) * LayoutConstants.DayWidth, height - ((total / max) * height));

    timelineVisual.children.add(graphics);

    return timelineVisual;
  }
}