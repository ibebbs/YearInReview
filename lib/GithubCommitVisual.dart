import 'package:pixi/pixi.dart';
import 'package:YearInReview/TimelineVisual.dart';
import 'package:YearInReview/LayoutConstants.dart';
import 'dart:html';
import 'dart:math';

class Contributions {
  DateTime _date;
  num _count;
  Colour _fill;

  Contributions (DateTime date, num count, Colour fill) {
    _date = date;
    _count = count;
    _fill = fill;
  }

  DateTime get Date => _date;
  num get Count => _count;
  Colour get Fill => _fill;
}

class GithubCommitVisual {
  static final num height = 16;

  static final List<Contributions> contributions = [
    new Contributions(DateTime.parse("2016-01-12"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-01-13"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-01-17"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-01-18"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-01-20"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-01-21"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-01-27"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-01-29"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-02-01"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-02-03"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-02-15"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-02-17"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-02-19"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-02-20"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-03-02"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-03-08"), 14, new Colour.fromHtml("#1e6823")),
    new Contributions(DateTime.parse("2016-03-15"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-03-19"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-03-24"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-03-30"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-04-09"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-04-10"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-04-13"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-04-16"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-05-02"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-07-27"), 7, new Colour.fromHtml("#44a340")),
    new Contributions(DateTime.parse("2016-08-02"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-08-03"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-08-04"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-08-05"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-08-06"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-08-07"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-08-08"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-08-10"), 5, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-08-11"), 6, new Colour.fromHtml("#44a340")),
    new Contributions(DateTime.parse("2016-08-15"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-08-16"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-08-18"), 9, new Colour.fromHtml("#1e6823")),
    new Contributions(DateTime.parse("2016-08-19"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-08-23"), 5, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-08-24"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-08-25"), 5, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-08-26"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-08-27"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-08-31"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-09-01"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-09-05"), 5, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-09-06"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-09-07"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-09-08"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-09-09"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-09-13"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-09-14"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-09-16"), 5, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-09-25"), 5, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-09-26"), 8, new Colour.fromHtml("#1e6823")),
    new Contributions(DateTime.parse("2016-09-27"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-09-30"), 5, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-10-04"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-10-05"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-10-08"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-10-09"), 5, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-10-10"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-10-11"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-10-12"), 8, new Colour.fromHtml("#1e6823")),
    new Contributions(DateTime.parse("2016-10-14"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-10-17"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-10-19"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-10-21"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-10-23"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-10-24"), 5, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-10-25"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-10-26"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-10-29"), 1, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-10-31"), 7, new Colour.fromHtml("#44a340")),
    new Contributions(DateTime.parse("2016-11-01"), 5, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-11-08"), 8, new Colour.fromHtml("#1e6823")),
    new Contributions(DateTime.parse("2016-11-09"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-11-11"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-11-12"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-11-13"), 5, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-11-15"), 10, new Colour.fromHtml("#1e6823")),
    new Contributions(DateTime.parse("2016-11-16"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-11-18"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-11-19"), 8, new Colour.fromHtml("#1e6823")),
    new Contributions(DateTime.parse("2016-11-20"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-11-22"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-11-25"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-11-28"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-11-29"), 9, new Colour.fromHtml("#1e6823")),
    new Contributions(DateTime.parse("2016-11-30"), 6, new Colour.fromHtml("#44a340")),
    new Contributions(DateTime.parse("2016-12-02"), 10, new Colour.fromHtml("#1e6823")),
    new Contributions(DateTime.parse("2016-12-07"), 3, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-12-09"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2016-12-12"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-12-13"), 9, new Colour.fromHtml("#1e6823")),
    new Contributions(DateTime.parse("2016-12-14"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-12-20"), 4, new Colour.fromHtml("#8cc665")),
    new Contributions(DateTime.parse("2016-12-23"), 7, new Colour.fromHtml("#44a340")),
    new Contributions(DateTime.parse("2017-01-03"), 2, new Colour.fromHtml("#d6e685")),
    new Contributions(DateTime.parse("2017-01-04"), 6, new Colour.fromHtml("#44a340")),
  ];

  TimelineVisual Initialize(DateTime startDate, num days) {  
    TimelineVisual timelineVisual = new TimelineVisual("Github Commits", (days * LayoutConstants.DayWidth), height + 4);

    Graphics graphics = new Graphics();
    graphics.position = new Point(LayoutConstants.HorizontalMargin, 0);

    DateTime maxDate = startDate.add(new Duration(days: days));

    contributions
        .where((c) => c.Date.isAfter(startDate) && c.Date.isBefore(maxDate))
        .forEach((c) {
          graphics.beginFill(c.Fill);
          graphics.drawRect(c.Date.difference(startDate).inDays * LayoutConstants.DayWidth, 0, LayoutConstants.DayWidth, height);
          graphics.endFill();
        });

    timelineVisual.children.add(graphics);

    return timelineVisual;
  }
}