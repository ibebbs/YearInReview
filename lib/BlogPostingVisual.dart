import 'package:pixi/pixi.dart';
import 'package:YearInReview/TimelineVisual.dart';
import 'package:YearInReview/LayoutConstants.dart';
import 'dart:html';
import 'dart:math';

class Post {
  DateTime _date;
  String  _title;

  Post (DateTime date, String title) {
    _date = date;
    _title = title;
  }

  DateTime get Date => _date;
  String get Title => _title;
}

class BlogPostingVisual {
  static final num height = 16;

  static final List<Post> posts = [
    new Post(DateTime.parse("2016-10-07"), "3D Printing with the CEL Robox"),
    new Post(DateTime.parse("2016-08-11"), "Achievement Unlocked!"),
    new Post(DateTime.parse("2016-12-07"), "A Rip Storing Time"),
    new Post(DateTime.parse("2016-12-22"), "CQRS/ES & MVVM using RX, EF & SQL in UWP & PCL"),
    new Post(DateTime.parse("2017-01-04"), "Getting started with Docker and Apache Kafka"),
    new Post(DateTime.parse("2015-12-07"), "Breaking News - Forgot to commit"),
    new Post(DateTime.parse("2016-04-08"), "Home Network Monitoring - Part I"),
    new Post(DateTime.parse("2016-04-10"), "Home Network Monitoring - Part II"),
    new Post(DateTime.parse("2016-04-12"), "Home Network Monitoring - Part III"),
    new Post(DateTime.parse("2016-04-16"), "Home Network Monitoring - Part IV"),
    new Post(DateTime.parse("2016-11-12"), "I contributed and all I got..."),
    new Post(DateTime.parse("2016-10-08"), "MonsterPi"),
    new Post(DateTime.parse("2016-11-09"), "Reactive State Machines"),
    new Post(DateTime.parse("2016-02-01"), "On the perils of traversing parallel universes"),
    new Post(DateTime.parse("2016-03-04"), "Using Rx on the Web"),
    new Post(DateTime.parse("2016-03-08"), "WebRx and Typescript"),
    new Post(DateTime.parse("2016-11-29"), "ToddlerBox Hits 1000 Users"),
    new Post(DateTime.parse("2016-11-16"), "ToddlerBox Released to the XBox Store"),
    new Post(DateTime.parse("2016-12-20"), "ToddlerBox Tops 10,000 Users!!"),
    new Post(DateTime.parse("2016-08-17"), "Using a Hyperlink in MVVM"),
    new Post(DateTime.parse("2016-09-01"), "The absolute easiest way to use SVG icons in UWP apps"),
    new Post(DateTime.parse("2016-10-10"), "UWP Community Toolkit v1.1 Released"),
    new Post(DateTime.parse("2016-07-26"), "Wot No Blog Posts?"),
  ];

  TimelineVisual Initialize(DateTime startDate, num days) {  
    TimelineVisual timelineVisual = new TimelineVisual("Blog Posts", (days * LayoutConstants.DayWidth), height + 4);

    Graphics graphics = new Graphics();
    graphics.position = new Point(LayoutConstants.HorizontalMargin, 0);
    graphics.beginFill(new Colour.fromInt(0x5AC8FD));

    DateTime maxDate = startDate.add(new Duration(days: days));

    posts
        .where((c) => c.Date.isAfter(startDate) && c.Date.isBefore(maxDate))
        .forEach((c) => graphics.drawRect(c.Date.difference(startDate).inDays * LayoutConstants.DayWidth, 0, LayoutConstants.DayWidth * 2, height));

    graphics.endFill();
    timelineVisual.children.add(graphics);

    return timelineVisual;
  }
}