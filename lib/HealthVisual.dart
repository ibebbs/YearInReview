import 'package:pixi/pixi.dart';
import 'package:YearInReview/TimelineVisual.dart';
import 'package:YearInReview/LayoutConstants.dart';
import 'dart:html';
import 'dart:math';

class Position {
  DateTime _date;
  double _weight;
  double _fatMass;

  Position (DateTime date, double weight, double fatMass) {
    _date = date;
    _weight = weight;
    _fatMass = fatMass;
  }

  DateTime get Date => _date;
  double get Weight => _weight;
  double get FatMass => _fatMass;
}

class HealthVisual {
  static final num weightHeight = 16;
  static final num fatMassHeight = 16;
  static final double desiredWeight = 70.0;
  static final double maxWeight = 71.0;
  static final double minWeight = 67.0;
  static final double desiredFatMass = 15.0;
  static final double minFatMass = 14.0;
  static final double maxFatMass = 17.0;

  static final Colour weightColour = new Colour(255, 191, 24);
  static final Colour fatMassColour = new Colour(158, 56, 78);

  static final List<Position> positions = [
    new Position(DateTime.parse("2016-01-08"), 68.5, 16.5),
    new Position(DateTime.parse("2016-01-11"), 69.0, 15.5),
    new Position(DateTime.parse("2016-02-07"), 68.2, 16.2),
    new Position(DateTime.parse("2016-02-16"), 69.1, 16.2),
    new Position(DateTime.parse("2016-02-26"), 69.1, 16.5),
    new Position(DateTime.parse("2016-03-01"), 69.4, 16.3),
    new Position(DateTime.parse("2016-03-05"), 69.8, 16.7),
    new Position(DateTime.parse("2016-03-09"), 69.6, 16.4),
    new Position(DateTime.parse("2016-03-16"), 69.9, 16.2),
    new Position(DateTime.parse("2016-04-18"), 67.5, 16.3),
    new Position(DateTime.parse("2016-04-24"), 67.5, 15.0),
    new Position(DateTime.parse("2016-12-17"), 69.1, 16.5),
    new Position(DateTime.parse("2017-01-15"), 69.3, 16.3),
  ];

  num CalculateWeightY(double weight) {
    double weightPercent = (weight - minWeight) / (maxWeight - minWeight);
    return weightHeight - (weightPercent * weightHeight);
  }
  
  num CalculateFatMassY(double fatmass) {
    double fatMassPercent = (fatmass - minFatMass) / (maxFatMass - minFatMass);
    return weightHeight + (fatMassHeight - (fatMassPercent * fatMassHeight));
  }

  TimelineVisual Initialize(DateTime startDate, num days) {  
    num width = (days * LayoutConstants.DayWidth);
    DateTime maxDate = startDate.add(new Duration(days: days + 1));

    TimelineVisual timelineVisual = new TimelineVisual("Health", width, weightHeight + fatMassHeight + 4);

    Graphics graphics = new Graphics();
    graphics.position = new Point(LayoutConstants.HorizontalMargin, 0);
    graphics.lineStyle(1, weightColour, 0.5);

    num y = CalculateWeightY(desiredWeight);

    for (num x = 0; x < width; x += 8) {
      graphics.moveTo(x, y);
      graphics.lineTo(x + 4, y);
    }

    graphics.lineStyle(2, weightColour, 1.0);
    y = CalculateWeightY(positions.first.Weight);
    graphics.moveTo(0, y);

    positions
        .where((p) => p.Date.isAfter(startDate) && p.Date.isBefore(maxDate))
        .forEach((p) => graphics.lineTo(p.Date.difference(startDate).inDays * LayoutConstants.DayWidth, CalculateWeightY(p.Weight)));

    graphics.lineStyle(1, fatMassColour, 0.5);

    y = CalculateFatMassY(desiredFatMass);

    for (num x = 0; x < width; x += 8) {
      graphics.moveTo(x, y);
      graphics.lineTo(x + 4, y);
    }
    
    graphics.lineStyle(2, fatMassColour, 1.0);
    y = CalculateFatMassY(positions.first.FatMass);
    graphics.moveTo(0, y);

    positions
        .where((p) => p.Date.isAfter(startDate) && p.Date.millisecondsSinceEpoch <= maxDate.millisecondsSinceEpoch)
        .forEach((p) => graphics.lineTo(p.Date.difference(startDate).inDays * LayoutConstants.DayWidth, CalculateFatMassY(p.FatMass)));

    timelineVisual.children.add(graphics);

    return timelineVisual;
  }
}