import 'package:pixi/pixi.dart';
import 'package:YearInReview/TimelineVisual.dart';
import 'package:YearInReview/LayoutConstants.dart';
import 'dart:html';
import 'dart:math';

class Commitment {
  DateTime _date;
  String  _title;

  Commitment (DateTime date, String title) {
    _date = date;
    _title = title;
  }

  DateTime get Date => _date;
  String get Title => _title;
}

class CommitmentsVisual {
  static final num height = 16;

  static final List<Commitment> posts = [
    new Commitment(DateTime.parse("2016-01-16"), "Chelsea vs Everton"),
    new Commitment(DateTime.parse("2016-01-19"), "Mia's Jabs"),
    new Commitment(DateTime.parse("2016-01-21"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-01-28"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-01-31"), "Meal with Ness & Adam"),
    new Commitment(DateTime.parse("2016-02-04"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-02-18"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-02-25"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-03-03"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-03-10"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-03-17"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-03-24"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-03-31"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-04-07"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-04-14"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-04-18"), "Tyre fitting for van"),
    new Commitment(DateTime.parse("2016-04-21"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-07-21"), "Mia's 9 month check-up"),
    new Commitment(DateTime.parse("2016-07-22"), "Mia's Nursery Induction"),
    new Commitment(DateTime.parse("2016-07-30"), "Lorgy & David's Wedding"),
    new Commitment(DateTime.parse("2016-08-09"), "Exam 357: Developing Mobile Apps (beta)"),
    new Commitment(DateTime.parse("2016-08-31"), "Mamma Mia Day"),
    new Commitment(DateTime.parse("2016-09-02"), "Mia's Birthday"),
    new Commitment(DateTime.parse("2016-09-15"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-09-22"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-09-29"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-10-01"), "Bleak Rehearsal"),
    new Commitment(DateTime.parse("2016-10-06"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-10-13"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-10-17"), "Bleak Rehearsal"),
    new Commitment(DateTime.parse("2016-10-20"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-10-20"), "Chilli-Tasting"),
    new Commitment(DateTime.parse("2016-10-29"), "Bleak Rehearsal"),
    new Commitment(DateTime.parse("2016-11-10"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-11-17"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-11-24"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-12-01"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-12-08"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2016-12-15"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2015-01-05"), "Mia's Swimming Lesson"),
    new Commitment(DateTime.parse("2015-01-07"), "Russ & Loiuse Visiting"),
    new Commitment(DateTime.parse("2015-01-12"), "Mia's Swimming Lesson"),
  ];

  TimelineVisual Initialize(DateTime startDate, num days) {  
    TimelineVisual timelineVisual = new TimelineVisual("Commitments", (days * LayoutConstants.DayWidth), height + 4);

    Graphics graphics = new Graphics();
    graphics.position = new Point(LayoutConstants.HorizontalMargin, 0);
    graphics.beginFill(new Colour.fromInt(0x9E384E));

    DateTime maxDate = startDate.add(new Duration(days: days));

    posts
        .where((c) => c.Date.isAfter(startDate) && c.Date.isBefore(maxDate))
        .forEach((c) => graphics.drawRect(c.Date.difference(startDate).inDays * LayoutConstants.DayWidth, 0, LayoutConstants.DayWidth, height));

    graphics.endFill();
    timelineVisual.children.add(graphics);

    return timelineVisual;
  }
}