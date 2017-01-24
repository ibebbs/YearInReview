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

class BandData {
  DateTime _date;
  num _steps;
  num _calories;

  BandData(DateTime date, num steps, num calories) {
    _date = date;
    _steps = steps;
    _calories = calories;
  }

  DateTime get Date => _date;
  num get Steps => _steps;
  num get Calories => _calories;
}

class HealthVisual {
  static final num weightHeight = 16;
  static final num fatMassHeight = 16;
  static final num totalHeight = weightHeight + fatMassHeight;
  static final double desiredWeight = 70.0;
  static final double maxWeight = 71.0;
  static final double minWeight = 67.0;
  static final double desiredFatMass = 15.0;
  static final double minFatMass = 14.0;
  static final double maxFatMass = 17.0;

  static final Colour weightColour = new Colour(255, 191, 24);
  static final Colour fatMassColour = new Colour(158, 56, 78);
  static final Colour stepColour = new Colour(25, 86, 131);

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

  static final List<BandData> bandData = [
    new BandData(DateTime.parse("2016-01-01"), 1518, 1264),
    new BandData(DateTime.parse("2016-01-02"), 24, 1203),
    new BandData(DateTime.parse("2016-01-03"), 6334, 1367),
    new BandData(DateTime.parse("2016-01-04"), 4360, 1470),
    new BandData(DateTime.parse("2016-01-05"), 8440, 1561),
    new BandData(DateTime.parse("2016-01-06"), 7970, 1525),
    new BandData(DateTime.parse("2016-01-07"), 8466, 1581),
    new BandData(DateTime.parse("2016-01-08"), 6314, 1435),
    new BandData(DateTime.parse("2016-01-09"), 30, 1199),
    new BandData(DateTime.parse("2016-01-10"), 7960, 1539),
    new BandData(DateTime.parse("2016-01-11"), 8442, 1665),
    new BandData(DateTime.parse("2016-01-12"), 11468, 1683),
    new BandData(DateTime.parse("2016-01-13"), 2100, 1355),
    new BandData(DateTime.parse("2016-01-14"), 15726, 2034),
    new BandData(DateTime.parse("2016-01-15"), 14588, 1944),
    new BandData(DateTime.parse("2016-01-16"), 4076, 1311),
    new BandData(DateTime.parse("2016-01-17"), 0, 1190),
    new BandData(DateTime.parse("2016-01-18"), 4774, 1462),
    new BandData(DateTime.parse("2016-01-19"), 0, 1194),
    new BandData(DateTime.parse("2016-01-20"), 6120, 1555),
    new BandData(DateTime.parse("2016-01-21"), 3246, 1405),
    new BandData(DateTime.parse("2016-01-22"), 1516, 1362),
    new BandData(DateTime.parse("2016-01-23"), 32, 1326),
    new BandData(DateTime.parse("2016-01-24"), 0, 1326),
    new BandData(DateTime.parse("2016-01-25"), 680, 1332),
    new BandData(DateTime.parse("2016-01-26"), 68, 1322),
    new BandData(DateTime.parse("2016-01-27"), 0, 1324),
    new BandData(DateTime.parse("2016-01-28"), 0, 1326),
    new BandData(DateTime.parse("2016-01-29"), 0, 1323),
    new BandData(DateTime.parse("2016-01-30"), 1148, 1370),
    new BandData(DateTime.parse("2016-01-31"), 4004, 1428),
    new BandData(DateTime.parse("2016-02-01"), 5450, 1542),
    new BandData(DateTime.parse("2016-02-02"), 983, 1325),
    new BandData(DateTime.parse("2016-02-03"), 3560, 1425),
    new BandData(DateTime.parse("2016-02-04"), 2780, 1441),
    new BandData(DateTime.parse("2016-02-05"), 6502, 1539),
    new BandData(DateTime.parse("2016-02-06"), 10549, 1727),
    new BandData(DateTime.parse("2016-02-07"), 5878, 1350),
    new BandData(DateTime.parse("2016-02-08"), 6489, 1707),
    new BandData(DateTime.parse("2016-02-09"), 10426, 1643),
    new BandData(DateTime.parse("2016-02-10"), 5849, 1400),
    new BandData(DateTime.parse("2016-02-11"), 8163, 1796),
    new BandData(DateTime.parse("2016-02-12"), 7325, 1586),
    new BandData(DateTime.parse("2016-02-13"), 8482, 1593),
    new BandData(DateTime.parse("2016-02-14"), 2532, 1257),
    new BandData(DateTime.parse("2016-02-15"), 7264, 1437),
    new BandData(DateTime.parse("2016-02-16"), 1253, 1228),
    new BandData(DateTime.parse("2016-02-17"), 4429, 1407),
    new BandData(DateTime.parse("2016-02-18"), 5086, 1373),
    new BandData(DateTime.parse("2016-02-19"), 4574, 1355),
    new BandData(DateTime.parse("2016-02-20"), 1520, 1258),
    new BandData(DateTime.parse("2016-02-21"), 7440, 1626),
    new BandData(DateTime.parse("2016-02-22"), 9076, 1562),
    new BandData(DateTime.parse("2016-02-23"), 7700, 1567),
    new BandData(DateTime.parse("2016-02-24"), 2927, 1418),
    new BandData(DateTime.parse("2016-02-25"), 10066, 1673),
    new BandData(DateTime.parse("2016-02-26"), 3825, 1545),
    new BandData(DateTime.parse("2016-02-27"), 91, 1247),
    new BandData(DateTime.parse("2016-02-28"), 2343, 1259),
    new BandData(DateTime.parse("2016-02-29"), 6341, 1431),
    new BandData(DateTime.parse("2016-03-01"), 2454, 1300),
    new BandData(DateTime.parse("2016-03-02"), 6237, 1549),
    new BandData(DateTime.parse("2016-03-03"), 1342, 1285),
    new BandData(DateTime.parse("2016-03-04"), 1387, 1337),
    new BandData(DateTime.parse("2016-03-05"), 12158, 1650),
    new BandData(DateTime.parse("2016-03-06"), 42, 1243),
    new BandData(DateTime.parse("2016-03-07"), 0, 1239),
    new BandData(DateTime.parse("2016-03-08"), 2974, 1390),
    new BandData(DateTime.parse("2016-03-09"), 4636, 1388),
    new BandData(DateTime.parse("2016-03-10"), 84, 1210),
    new BandData(DateTime.parse("2016-03-11"), 4490, 1468),
    new BandData(DateTime.parse("2016-03-12"), 14, 1203),
    new BandData(DateTime.parse("2016-03-13"), 0, 1211),
    new BandData(DateTime.parse("2016-03-14"), 4608, 1512),
    new BandData(DateTime.parse("2016-03-15"), 6064, 1652),
    new BandData(DateTime.parse("2016-03-16"), 7315, 1519),
    new BandData(DateTime.parse("2016-03-17"), 6871, 1663),
    new BandData(DateTime.parse("2016-03-18"), 4195, 1482),
    new BandData(DateTime.parse("2016-03-19"), 7061, 1500),
    new BandData(DateTime.parse("2016-03-20"), 7315, 1682),
    new BandData(DateTime.parse("2016-03-21"), 1112, 1234),
    new BandData(DateTime.parse("2016-03-22"), 7820, 1676),
    new BandData(DateTime.parse("2016-03-23"), 5079, 1600),
    new BandData(DateTime.parse("2016-03-24"), 4709, 1439),
    new BandData(DateTime.parse("2016-03-25"), 479, 1223),
    new BandData(DateTime.parse("2016-03-26"), 5665, 1595),
    new BandData(DateTime.parse("2016-03-28"), 3148, 1366),
    new BandData(DateTime.parse("2016-03-29"), 4962, 1582),
    new BandData(DateTime.parse("2016-03-30"), 2921, 1330),
    new BandData(DateTime.parse("2016-03-31"), 3391, 1345),
    new BandData(DateTime.parse("2016-04-01"), 1658, 1266),
    new BandData(DateTime.parse("2016-04-02"), 7851, 1757),
    new BandData(DateTime.parse("2016-04-03"), 2998, 1282),
    new BandData(DateTime.parse("2016-04-04"), 2742, 1497),
    new BandData(DateTime.parse("2016-04-05"), 2681, 1283),
    new BandData(DateTime.parse("2016-04-06"), 2613, 1400),
    new BandData(DateTime.parse("2016-04-07"), 6676, 1567),
    new BandData(DateTime.parse("2016-04-08"), 1252, 1246),
    new BandData(DateTime.parse("2016-04-09"), 1708, 1422),
    new BandData(DateTime.parse("2016-04-10"), 7722, 1519),
    new BandData(DateTime.parse("2016-04-11"), 868, 1209),
    new BandData(DateTime.parse("2016-04-12"), 2991, 1503),
    new BandData(DateTime.parse("2016-04-13"), 5009, 1381),
    new BandData(DateTime.parse("2016-04-14"), 2103, 1269),
    new BandData(DateTime.parse("2016-04-15"), 3952, 1415),
    new BandData(DateTime.parse("2016-04-16"), 715, 1208),
    new BandData(DateTime.parse("2016-04-17"), 129, 1211),
    new BandData(DateTime.parse("2016-04-18"), 487, 1215),
    new BandData(DateTime.parse("2016-04-19"), 7052, 1567),
    new BandData(DateTime.parse("2016-04-20"), 16516, 1752),
    new BandData(DateTime.parse("2016-04-21"), 10216, 1745),
    new BandData(DateTime.parse("2016-04-22"), 3891, 1490),
    new BandData(DateTime.parse("2016-04-23"), 5667, 1495),
    new BandData(DateTime.parse("2016-04-24"), 4416, 1523),
    new BandData(DateTime.parse("2016-04-25"), 0, 1196),
    new BandData(DateTime.parse("2016-04-26"), 2403, 1254),
    new BandData(DateTime.parse("2016-04-27"), 7056, 1679),
    new BandData(DateTime.parse("2016-04-28"), 6137, 1367),
    new BandData(DateTime.parse("2016-04-29"), 5589, 1554),
    new BandData(DateTime.parse("2016-04-30"), 6347, 1645),
    new BandData(DateTime.parse("2016-05-01"), 2710, 1384),
    new BandData(DateTime.parse("2016-05-02"), 11298, 1585),
    new BandData(DateTime.parse("2016-05-03"), 6803, 1423),
    new BandData(DateTime.parse("2016-05-04"), 5353, 1394),
    new BandData(DateTime.parse("2016-05-05"), 7472, 1443),
    new BandData(DateTime.parse("2016-05-06"), 5138, 1349),
    new BandData(DateTime.parse("2016-05-07"), 4554, 1670),
    new BandData(DateTime.parse("2016-05-08"), 4900, 1561),
    new BandData(DateTime.parse("2016-05-09"), 4496, 1393),
    new BandData(DateTime.parse("2016-05-10"), 6975, 1559),
    new BandData(DateTime.parse("2016-05-11"), 8242, 1497),
    new BandData(DateTime.parse("2016-05-12"), 6937, 1421),
    new BandData(DateTime.parse("2016-05-13"), 8508, 1571),
    new BandData(DateTime.parse("2016-05-14"), 2044, 1263),
    new BandData(DateTime.parse("2016-05-15"), 8306, 1679),
    new BandData(DateTime.parse("2016-05-16"), 6615, 1379),
    new BandData(DateTime.parse("2016-05-17"), 2738, 1265),
    new BandData(DateTime.parse("2016-05-18"), 4785, 1560),
    new BandData(DateTime.parse("2016-05-19"), 7551, 1603),
    new BandData(DateTime.parse("2016-05-20"), 3563, 1289),
    new BandData(DateTime.parse("2016-05-21"), 10847, 1621),
    new BandData(DateTime.parse("2016-05-22"), 12252, 1770),
    new BandData(DateTime.parse("2016-05-23"), 16372, 1959),
    new BandData(DateTime.parse("2016-05-24"), 9760, 1552),
    new BandData(DateTime.parse("2016-05-25"), 10637, 1483),
    new BandData(DateTime.parse("2016-05-26"), 15283, 1752),
    new BandData(DateTime.parse("2016-05-27"), 12938, 1763),
    new BandData(DateTime.parse("2016-05-28"), 11109, 1688),
    new BandData(DateTime.parse("2016-05-29"), 15995, 1864),
    new BandData(DateTime.parse("2016-05-30"), 15653, 1731),
    new BandData(DateTime.parse("2016-05-31"), 9698, 1594),
    new BandData(DateTime.parse("2016-06-01"), 9448, 1786),
    new BandData(DateTime.parse("2016-06-02"), 12880, 1724),
    new BandData(DateTime.parse("2016-06-03"), 11504, 1600),
    new BandData(DateTime.parse("2016-06-04"), 19538, 1787),
    new BandData(DateTime.parse("2016-06-05"), 11511, 1618),
    new BandData(DateTime.parse("2016-06-06"), 5812, 1496),
    new BandData(DateTime.parse("2016-06-07"), 7011, 1751),
    new BandData(DateTime.parse("2016-06-08"), 5378, 1410),
    new BandData(DateTime.parse("2016-06-09"), 11586, 1642),
    new BandData(DateTime.parse("2016-06-10"), 6627, 1724),
    new BandData(DateTime.parse("2016-06-11"), 8778, 1648),
    new BandData(DateTime.parse("2016-06-12"), 10032, 1610),
    new BandData(DateTime.parse("2016-06-13"), 12086, 1829),
    new BandData(DateTime.parse("2016-06-14"), 10967, 1633),
    new BandData(DateTime.parse("2016-06-15"), 11015, 1656),
    new BandData(DateTime.parse("2016-06-16"), 14473, 2027),
    new BandData(DateTime.parse("2016-06-17"), 10099, 1692),
    new BandData(DateTime.parse("2016-06-18"), 6060, 1490),
    new BandData(DateTime.parse("2016-06-19"), 10575, 1968),
    new BandData(DateTime.parse("2016-06-20"), 15626, 1852),
    new BandData(DateTime.parse("2016-06-21"), 7363, 1570),
    new BandData(DateTime.parse("2016-06-22"), 6782, 1568),
    new BandData(DateTime.parse("2016-06-23"), 11235, 1804),
    new BandData(DateTime.parse("2016-06-24"), 9070, 1500),
    new BandData(DateTime.parse("2016-06-25"), 7836, 1506),
    new BandData(DateTime.parse("2016-06-26"), 18405, 1824),
    new BandData(DateTime.parse("2016-06-27"), 12268, 1735),
    new BandData(DateTime.parse("2016-06-28"), 15653, 1782),
    new BandData(DateTime.parse("2016-06-29"), 7367, 1623),
    new BandData(DateTime.parse("2016-06-30"), 11676, 1940),
    new BandData(DateTime.parse("2016-07-01"), 8628, 1764),
    new BandData(DateTime.parse("2016-07-02"), 11382, 1647),
    new BandData(DateTime.parse("2016-07-03"), 11230, 1612),
    new BandData(DateTime.parse("2016-07-04"), 4962, 1593),
    new BandData(DateTime.parse("2016-07-05"), 9275, 1525),
    new BandData(DateTime.parse("2016-07-06"), 11754, 1879),
    new BandData(DateTime.parse("2016-07-07"), 7158, 1615),
    new BandData(DateTime.parse("2016-07-08"), 10969, 1809),
    new BandData(DateTime.parse("2016-07-09"), 12222, 1709),
    new BandData(DateTime.parse("2016-07-10"), 9907, 1947),
    new BandData(DateTime.parse("2016-07-11"), 7422, 1860),
    new BandData(DateTime.parse("2016-07-12"), 6445, 1685),
    new BandData(DateTime.parse("2016-07-13"), 12212, 1779),
    new BandData(DateTime.parse("2016-07-14"), 4348, 1530),
    new BandData(DateTime.parse("2016-07-15"), 4981, 1505),
    new BandData(DateTime.parse("2016-07-16"), 6375, 1395),
    new BandData(DateTime.parse("2016-07-17"), 5457, 1388),
    new BandData(DateTime.parse("2016-07-18"), 6506, 1581),
    new BandData(DateTime.parse("2016-07-19"), 10436, 1717),
    new BandData(DateTime.parse("2016-07-20"), 0, 1246),
    new BandData(DateTime.parse("2016-07-21"), 4024, 1390),
    new BandData(DateTime.parse("2016-07-22"), 0, 1244),
    new BandData(DateTime.parse("2016-07-23"), 0, 1246),
    new BandData(DateTime.parse("2016-07-24"), 2738, 1343),
    new BandData(DateTime.parse("2016-07-25"), 0, 1245),
    new BandData(DateTime.parse("2016-07-26"), 0, 1365),
    new BandData(DateTime.parse("2016-07-27"), 4810, 1681),
    new BandData(DateTime.parse("2016-07-28"), 3804, 1492),
    new BandData(DateTime.parse("2016-07-29"), 5268, 1724),
    new BandData(DateTime.parse("2016-07-30"), 10126, 2246),
    new BandData(DateTime.parse("2016-07-31"), 0, 1467),
    new BandData(DateTime.parse("2016-08-01"), 397, 1467),
    new BandData(DateTime.parse("2016-08-02"), 1033, 1467),
    new BandData(DateTime.parse("2016-08-03"), 3366, 1570),
    new BandData(DateTime.parse("2016-08-04"), 2451, 1654),
    new BandData(DateTime.parse("2016-08-05"), 5232, 1482),
    new BandData(DateTime.parse("2016-08-06"), 1448, 1266),
    new BandData(DateTime.parse("2016-08-07"), 1695, 1251),
    new BandData(DateTime.parse("2016-08-08"), 1708, 1264),
    new BandData(DateTime.parse("2016-08-09"), 5594, 2598),
    new BandData(DateTime.parse("2016-08-10"), 2969, 1436),
    new BandData(DateTime.parse("2016-08-11"), 2440, 1953),
    new BandData(DateTime.parse("2016-08-12"), 333, 1245),
    new BandData(DateTime.parse("2016-08-13"), 3874, 1611),
    new BandData(DateTime.parse("2016-08-14"), 6658, 1538),
    new BandData(DateTime.parse("2016-08-15"), 481, 1245),
    new BandData(DateTime.parse("2016-08-16"), 4066, 1462),
    new BandData(DateTime.parse("2016-08-17"), 11496, 2234),
    new BandData(DateTime.parse("2016-08-18"), 2472, 2251),
    new BandData(DateTime.parse("2016-08-19"), 3730, 2003),
    new BandData(DateTime.parse("2016-08-20"), 1005, 1225),
    new BandData(DateTime.parse("2016-08-21"), 7219, 1876),
    new BandData(DateTime.parse("2016-08-22"), 6625, 1612),
    new BandData(DateTime.parse("2016-08-23"), 1244, 1254),
    new BandData(DateTime.parse("2016-08-24"), 1021, 1457),
    new BandData(DateTime.parse("2016-08-25"), 2029, 1281),
    new BandData(DateTime.parse("2016-08-26"), 1681, 1342),
    new BandData(DateTime.parse("2016-08-27"), 7062, 1785),
    new BandData(DateTime.parse("2016-08-28"), 2119, 1347),
    new BandData(DateTime.parse("2016-08-29"), 5470, 1305),
    new BandData(DateTime.parse("2016-08-30"), 10623, 1762),
    new BandData(DateTime.parse("2016-08-31"), 3507, 1474),
    new BandData(DateTime.parse("2016-09-01"), 3916, 1650),
    new BandData(DateTime.parse("2016-09-02"), 4527, 1457),
    new BandData(DateTime.parse("2016-09-03"), 5942, 1660),
    new BandData(DateTime.parse("2016-09-04"), 8283, 1763),
    new BandData(DateTime.parse("2016-09-05"), 3035, 1515),
    new BandData(DateTime.parse("2016-09-06"), 2566, 2047),
    new BandData(DateTime.parse("2016-09-07"), 2668, 1745),
    new BandData(DateTime.parse("2016-09-08"), 21263, 2399),
    new BandData(DateTime.parse("2016-09-09"), 7658, 1827),
    new BandData(DateTime.parse("2016-09-10"), 8440, 1609),
    new BandData(DateTime.parse("2016-09-11"), 4000, 1366),
    new BandData(DateTime.parse("2016-09-12"), 5088, 1534),
    new BandData(DateTime.parse("2016-09-13"), 5040, 1509),
    new BandData(DateTime.parse("2016-09-14"), 3517, 1868),
    new BandData(DateTime.parse("2016-09-15"), 6991, 1709),
    new BandData(DateTime.parse("2016-09-16"), 2138, 1390),
    new BandData(DateTime.parse("2016-09-17"), 2545, 1269),
    new BandData(DateTime.parse("2016-09-18"), 10376, 1645),
    new BandData(DateTime.parse("2016-09-19"), 5454, 1662),
    new BandData(DateTime.parse("2016-09-20"), 15235, 1661),
    new BandData(DateTime.parse("2016-09-21"), 16075, 1823),
    new BandData(DateTime.parse("2016-09-22"), 7933, 1527),
    new BandData(DateTime.parse("2016-09-23"), 3246, 1404),
    new BandData(DateTime.parse("2016-09-24"), 4955, 1446),
    new BandData(DateTime.parse("2016-09-25"), 7286, 1667),
    new BandData(DateTime.parse("2016-09-26"), 1135, 1246),
    new BandData(DateTime.parse("2016-09-27"), 2097, 1453),
    new BandData(DateTime.parse("2016-09-28"), 12970, 2035),
    new BandData(DateTime.parse("2016-09-29"), 4157, 1581),
    new BandData(DateTime.parse("2016-09-30"), 1511, 1709),
    new BandData(DateTime.parse("2016-10-01"), 3752, 1531),
    new BandData(DateTime.parse("2016-10-02"), 8479, 1828),
    new BandData(DateTime.parse("2016-10-03"), 7789, 1649),
    new BandData(DateTime.parse("2016-10-04"), 4609, 1701),
    new BandData(DateTime.parse("2016-10-05"), 3372, 1588),
    new BandData(DateTime.parse("2016-10-05"), 3372, 1589),
    new BandData(DateTime.parse("2016-10-06"), 5575, 1577),
    new BandData(DateTime.parse("2016-10-07"), 4646, 1926),
    new BandData(DateTime.parse("2016-10-08"), 568, 1214),
    new BandData(DateTime.parse("2016-10-09"), 6980, 1404),
    new BandData(DateTime.parse("2016-10-10"), 2684, 1325),
    new BandData(DateTime.parse("2016-10-11"), 2374, 1369),
    new BandData(DateTime.parse("2016-10-12"), 2414, 1602),
    new BandData(DateTime.parse("2016-10-13"), 9326, 1736),
    new BandData(DateTime.parse("2016-10-14"), 2040, 1597),
    new BandData(DateTime.parse("2016-10-15"), 5378, 1724),
    new BandData(DateTime.parse("2016-10-16"), 5249, 1685),
    new BandData(DateTime.parse("2016-10-17"), 2651, 1569),
    new BandData(DateTime.parse("2016-10-18"), 8053, 1597),
    new BandData(DateTime.parse("2016-10-19"), 5865, 1509),
    new BandData(DateTime.parse("2016-10-20"), 3712, 1356),
    new BandData(DateTime.parse("2016-10-21"), 1409, 1459),
    new BandData(DateTime.parse("2016-10-22"), 2776, 1426),
    new BandData(DateTime.parse("2016-10-23"), 1323, 1279),
    new BandData(DateTime.parse("2016-10-24"), 1158, 1335),
    new BandData(DateTime.parse("2016-10-25"), 1873, 1263),
    new BandData(DateTime.parse("2016-10-26"), 4088, 1856),
    new BandData(DateTime.parse("2016-10-27"), 3818, 1866),
    new BandData(DateTime.parse("2016-10-28"), 2053, 2237),
    new BandData(DateTime.parse("2016-10-29"), 3808, 1839),
    new BandData(DateTime.parse("2016-10-30"), 2214, 1255),
    new BandData(DateTime.parse("2016-10-31"), 764, 1267),
    new BandData(DateTime.parse("2016-11-01"), 2760, 1941),
    new BandData(DateTime.parse("2016-11-02"), 479, 1242),
    new BandData(DateTime.parse("2016-11-03"), 6534, 2050),
    new BandData(DateTime.parse("2016-11-04"), 8196, 2122),
    new BandData(DateTime.parse("2016-11-05"), 10624, 3058),
    new BandData(DateTime.parse("2016-11-06"), 6384, 1830),
    new BandData(DateTime.parse("2016-11-07"), 7241, 1620),
    new BandData(DateTime.parse("2016-11-08"), 3088, 1524),
    new BandData(DateTime.parse("2016-11-09"), 1960, 1693),
    new BandData(DateTime.parse("2016-11-10"), 6117, 1863),
    new BandData(DateTime.parse("2016-11-11"), 5978, 1698),
    new BandData(DateTime.parse("2016-11-12"), 3300, 1564),
    new BandData(DateTime.parse("2016-11-13"), 275, 1248),
    new BandData(DateTime.parse("2016-11-14"), 2796, 1655),
    new BandData(DateTime.parse("2016-11-15"), 1308, 1219),
    new BandData(DateTime.parse("2016-11-16"), 2418, 1470),
    new BandData(DateTime.parse("2016-11-17"), 831, 1206),
    new BandData(DateTime.parse("2016-11-18"), 248, 1193),
    new BandData(DateTime.parse("2016-11-19"), 896, 1208),
    new BandData(DateTime.parse("2016-11-20"), 795, 1201),
    new BandData(DateTime.parse("2016-11-21"), 722, 1204),
    new BandData(DateTime.parse("2016-11-22"), 2178, 1634),
    new BandData(DateTime.parse("2016-11-23"), 19848, 2236),
    new BandData(DateTime.parse("2016-11-24"), 5243, 1764),
    new BandData(DateTime.parse("2016-11-25"), 3163, 1598),
    new BandData(DateTime.parse("2016-11-26"), 6901, 1727),
    new BandData(DateTime.parse("2016-11-27"), 4174, 1844),
    new BandData(DateTime.parse("2016-11-28"), 354, 1236),
    new BandData(DateTime.parse("2016-11-29"), 2136, 1641),
    new BandData(DateTime.parse("2016-11-30"), 2844, 1674),
    new BandData(DateTime.parse("2016-12-01"), 5282, 1690),
    new BandData(DateTime.parse("2016-12-02"), 4677, 1828),
    new BandData(DateTime.parse("2016-12-03"), 5436, 1529),
    new BandData(DateTime.parse("2016-12-04"), 7075, 1645),
    new BandData(DateTime.parse("2016-12-05"), 291, 1232),
    new BandData(DateTime.parse("2016-12-06"), 4786, 2011),
    new BandData(DateTime.parse("2016-12-07"), 4353, 2221),
    new BandData(DateTime.parse("2016-12-08"), 2901, 1247),
    new BandData(DateTime.parse("2016-12-09"), 7357, 1691),
    new BandData(DateTime.parse("2016-12-10"), 3297, 1677),
    new BandData(DateTime.parse("2016-12-11"), 8674, 1586),
    new BandData(DateTime.parse("2016-12-12"), 3685, 1268),
    new BandData(DateTime.parse("2016-12-13"), 2961, 1905),
    new BandData(DateTime.parse("2016-12-14"), 4278, 1869),
    new BandData(DateTime.parse("2016-12-15"), 7387, 1472),
    new BandData(DateTime.parse("2016-12-16"), 2726, 1559),
    new BandData(DateTime.parse("2016-12-17"), 2876, 1886),
    new BandData(DateTime.parse("2016-12-18"), 12251, 1992),
    new BandData(DateTime.parse("2016-12-19"), 187, 1229),
    new BandData(DateTime.parse("2016-12-20"), 4535, 2302),
    new BandData(DateTime.parse("2016-12-21"), 5204, 1995),
    new BandData(DateTime.parse("2016-12-22"), 3374, 1781),
    new BandData(DateTime.parse("2016-12-23"), 3158, 1403),
    new BandData(DateTime.parse("2016-12-24"), 735, 1242),
    new BandData(DateTime.parse("2016-12-25"), 2958, 2043),
    new BandData(DateTime.parse("2016-12-26"), 9375, 1692),
    new BandData(DateTime.parse("2016-12-27"), 6668, 1598),
    new BandData(DateTime.parse("2016-12-28"), 5465, 1636),
    new BandData(DateTime.parse("2016-12-29"), 217, 1240),
    new BandData(DateTime.parse("2016-12-30"), 4615, 1438),
    new BandData(DateTime.parse("2016-12-31"), 4320, 1465),
    new BandData(DateTime.parse("2017-01-01"), 3929, 1511),
    new BandData(DateTime.parse("2017-01-02"), 5734, 1862),
    new BandData(DateTime.parse("2017-01-03"), 2556, 1900),
    new BandData(DateTime.parse("2017-01-04"), 2987, 1863),
    new BandData(DateTime.parse("2017-01-05"), 4282, 1523),
    new BandData(DateTime.parse("2017-01-06"), 2746, 1706),
    new BandData(DateTime.parse("2017-01-07"), 3403, 1681),
    new BandData(DateTime.parse("2017-01-08"), 4967, 2197),
    new BandData(DateTime.parse("2017-01-09"), 448, 1243),
    new BandData(DateTime.parse("2017-01-10"), 1304, 1388),
    new BandData(DateTime.parse("2017-01-11"), 980, 470),
    new BandData(DateTime.parse("2017-01-12"), 6929, 1966),
    new BandData(DateTime.parse("2017-01-13"), 3084, 2049),
    new BandData(DateTime.parse("2017-01-14"), 2414, 1328)
  ];

  static final num maxSteps = bandData.map((bd) => bd.Steps).fold(0, (a, s) => s > a ? s : a);

  num CalculateWeightY(double weight) {
    double weightPercent = (weight - minWeight) / (maxWeight - minWeight);
    return weightHeight - (weightPercent * weightHeight);
  }
  
  num CalculateFatMassY(double fatmass) {
    double fatMassPercent = (fatmass - minFatMass) / (maxFatMass - minFatMass);
    return weightHeight + (fatMassHeight - (fatMassPercent * fatMassHeight));
  }

  num CalculateStepY(num steps) {
    num percent = steps / maxSteps;
    return 0 - (totalHeight * percent);
  }

  TimelineVisual Initialize(DateTime startDate, num days) {  
    num width = (days * LayoutConstants.DayWidth);
    DateTime maxDate = startDate.add(new Duration(days: days + 1));

    TimelineVisual timelineVisual = new TimelineVisual("Health", width, totalHeight + 4);

    Graphics graphics = new Graphics();
    graphics.position = new Point(LayoutConstants.HorizontalMargin, 0);
    graphics.beginFill(stepColour, 0.3);

    bandData
        .where((bd) => bd.Date.isAfter(startDate) && bd.Date.isBefore(maxDate))
        .forEach((bd) => graphics.drawRect(bd.Date.difference(startDate).inDays * LayoutConstants.DayWidth + 1, totalHeight, LayoutConstants.DayWidth - 1, CalculateStepY(bd.Steps)));

    graphics.endFill();
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
        .where((p) => p.Date.isAfter(startDate) && p.Date.isBefore(maxDate))
        .forEach((p) => graphics.lineTo(p.Date.difference(startDate).inDays * LayoutConstants.DayWidth, CalculateFatMassY(p.FatMass)));

    timelineVisual.children.add(graphics);

    return timelineVisual;
  }
}