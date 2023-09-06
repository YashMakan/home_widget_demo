import 'dart:math';

class Location {
  final double lat;
  final double long;

  Location(this.lat, this.long);

  factory Location.pickLocation() {
    return [
      Location(37.3263, -2.2704),
      Location(-35.3559, -66.0863),
      Location(45.1546, 12.2764),
      Location(49.1844, -97.9434),
      Location(45.5284, 23.1994),
      Location(48.7128, 11.0792),
      Location(46.6293, 0.6555),
      Location(46.5593, 0.2534),
      Location(37.7421, 120.7758),
      Location(45.8228, 7.7162),
      Location(50.1616, 3.1512),
      Location(46.2765, 13.9513),
      Location(31.3110, 34.6131),
      Location(47.1242, -0.9829),
      Location(-0.8886, 30.2635),
      Location(40.0451, 18.3747),
      Location(48.8075, 103.5518),
      Location(9.0047, 125.5791),
      Location(41.0402, -80.3300),
      Location(12.9916, 11.2760),
      Location(6.5997, 124.4502),
      Location(36.7957, 66.9027),
      Location(42.6016, 21.2979),
      Location(-7.5159, 112.5695),
      Location(32.4719, -94.0456),
      Location(40.8430, -74.2761),
      Location(48.2107, 14.4110),
      Location(41.4020, -74.3243),
      Location(19.1167, -98.2302),
      Location(44.6197, 26.2425),
      Location(39.8603, -6.3867),
      Location(50.3122, -5.1927),
      Location(-9.7195, 120.3072),
      Location(23.2066, 77.0792),
      Location(51.6800, 38.5261),
      Location(45.6585, 11.1076),
      Location(45.0953, 25.1125),
      Location(30.2724, 113.0856),
    ].elementAt(Random().nextInt(8));
  }
}
