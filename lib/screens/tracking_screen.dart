import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'history_screen.dart';
import 'settings_screen.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() =>
      _TrackingScreenState();
}

class _TrackingScreenState
    extends State<TrackingScreen> {
  Timer? timer;

  int totalSeconds = 180;
  int secondsLeft = 180;
  int routeStep = 0;

  final List<Offset> route = [
    Offset(25, 60),
    Offset(55, 60),
    Offset(85, 60),
    Offset(115, 60),
    Offset(145, 60),
    Offset(175, 60),
    Offset(205, 60),
    Offset(235, 60),
    Offset(235, 95),
    Offset(235, 125),
    Offset(235, 155),
    Offset(235, 185),
    Offset(235, 215),
    Offset(260, 215),
    Offset(285, 215),
    Offset(310, 215),
  ];

  @override
  void initState() {
    super.initState();
    startTracking();
  }

  void startTracking() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (!mounted) return;

        setState(() {
          if (secondsLeft > 0) {
            secondsLeft--;
          }

          int maxStep =
              route.length - 1;

          routeStep =
              ((totalSeconds -
                  secondsLeft) *
                  maxStep ~/
                  totalSeconds)
                  .clamp(
                  0, maxStep);
        });
      },
    );
  }

  String get eta {
    int min =
        secondsLeft ~/ 60;
    int sec =
        secondsLeft % 60;

    return "$min:${sec.toString().padLeft(2, '0')}";
  }

  bool get arrived =>
      secondsLeft == 0;

  Widget navButton(
      BuildContext context,
      IconData icon,
      bool active,
      Widget page,
      ) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
            page,
          ),
        );
      },
      icon: Icon(
        icon,
        size: 28,
        color: active
            ? Colors.red
            : Colors.grey,
      ),
    );
  }

  Widget road(
      double left,
      double top,
      double width,
      double height,
      ) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: width,
        height: height,
        decoration:
        BoxDecoration(
          color:
          Colors.white,
          borderRadius:
          BorderRadius.circular(
              10),
        ),
      ),
    );
  }

  Widget label(
      String text,
      double left,
      double top,
      ) {
    return Positioned(
      left: left,
      top: top,
      child: Text(
        text,
        style:
        const TextStyle(
          fontSize: 11,
          color:
          Colors.black54,
          fontWeight:
          FontWeight.w600,
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(
      BuildContext context) {
    final pos =
    route[routeStep];

    return Scaffold(
      backgroundColor:
      const Color(
          0xfff7f7f7),

      appBar: AppBar(
        backgroundColor:
        Colors.red,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Live Tracking",
          style: TextStyle(
            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [

          const SizedBox(
              height: 14),

          Container(
            margin:
            const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            padding:
            const EdgeInsets.all(
                14),
            decoration:
            BoxDecoration(
              color:
              Colors.white,
              borderRadius:
              BorderRadius.circular(
                  18),
            ),
            child: Row(
              children: [

                const CircleAvatar(
                  radius: 24,
                  backgroundColor:
                  Colors.red,
                  child: Icon(
                    Icons.person,
                    color: Colors
                        .white,
                  ),
                ),

                const SizedBox(
                    width: 12),

                const Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [

                      Text(
                        "Rajesh Kumar",
                        style:
                        TextStyle(
                          fontWeight:
                          FontWeight.bold,
                          fontSize:
                          16,
                        ),
                      ),

                      SizedBox(
                          height:
                          4),

                      Text(
                        "Ambulance 12 • On Route",
                        style:
                        TextStyle(
                          color: Colors
                              .grey,
                          fontSize:
                          13,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal:
                    12,
                    vertical: 8,
                  ),
                  decoration:
                  BoxDecoration(
                    color: arrived
                        ? Colors.green
                        .shade100
                        : Colors.red
                        .shade100,
                    borderRadius:
                    BorderRadius.circular(
                        12),
                  ),
                  child: Text(
                    arrived
                        ? "ARRIVED"
                        : eta,
                    style:
                    TextStyle(
                      color: arrived
                          ? Colors.green
                          : Colors.red,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
              height: 18),

          Container(
            margin:
            const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            height: 390,
            decoration:
            BoxDecoration(
              color:
              const Color(
                  0xffe6eaed),
              borderRadius:
              BorderRadius.circular(
                  22),
            ),
            child: Stack(
              children: [

                road(
                    15,
                    55,
                    235,
                    10),
                road(
                    230,
                    55,
                    10,
                    170),
                road(
                    230,
                    210,
                    95,
                    10),
                road(
                    80,
                    145,
                    160,
                    10),
                road(
                    80,
                    90,
                    10,
                    140),
                road(
                    45,
                    300,
                    260,
                    10),

                label(
                    "Raipur Central",
                    110,
                    18),
                label(
                    "Main Road",
                    110,
                    72),
                label(
                    "Hospital Lane",
                    90,
                    120),
                label(
                    "Ring Road",
                    135,
                    320),
                label(
                    "Sector 9",
                    20,
                    260),

                const Positioned(
                  left: 52,
                  top: 102,
                  child: Icon(
                    Icons
                        .local_hospital,
                    color:
                    Colors.red,
                    size: 28,
                  ),
                ),

                const Positioned(
                  left: 285,
                  top: 165,
                  child: Icon(
                    Icons
                        .local_hospital,
                    color:
                    Colors.red,
                    size: 28,
                  ),
                ),

                AnimatedContainer(
                  duration:
                  const Duration(
                      milliseconds:
                      700),
                  margin:
                  const EdgeInsets.only(
                      left: 302,
                      top: 188),
                  child: const Icon(
                    Icons
                        .location_pin,
                    color:
                    Colors.red,
                    size: 42,
                  ),
                ),

                AnimatedPositioned(
                  duration:
                  const Duration(
                      milliseconds:
                      850),
                  left: pos.dx,
                  top: pos.dy,
                  child: const Text(
                    "🚑",
                    style:
                    TextStyle(
                      fontSize:
                      28,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
              height: 18),

          Padding(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SizedBox(
              width: double
                  .infinity,
              child:
              ElevatedButton.icon(
                onPressed:
                    () {
                  ScaffoldMessenger.of(
                      context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Calling Driver...",
                      ),
                    ),
                  );
                },
                icon:
                const Icon(
                  Icons.call,
                  color: Colors
                      .white,
                ),
                label: Text(
                  arrived
                      ? "Driver Waiting"
                      : "Call Driver",
                  style:
                  const TextStyle(
                    color: Colors
                        .white,
                  ),
                ),
                style:
                ElevatedButton.styleFrom(
                  backgroundColor:
                  Colors.green,
                  padding:
                  const EdgeInsets.symmetric(
                    vertical:
                    14,
                  ),
                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                        14),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
              height: 12),

          Text(
            arrived
                ? "Emergency unit has reached your location"
                : "Emergency unit is arriving on route",
            style:
            const TextStyle(
              color:
              Colors.grey,
              fontSize: 14,
            ),
          ),

          const Spacer(),

          Container(
            padding:
            const EdgeInsets.symmetric(
              vertical: 15,
            ),
            decoration:
            const BoxDecoration(
              color:
              Colors.white,
              borderRadius:
              BorderRadius.vertical(
                top: Radius.circular(
                    25),
              ),
            ),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceAround,
              children: [

                navButton(
                  context,
                  Icons.home,
                  false,
                  const HomeScreen(),
                ),

                navButton(
                  context,
                  Icons.location_pin,
                  true,
                  const TrackingScreen(),
                ),

                navButton(
                  context,
                  Icons.history,
                  false,
                  const HistoryScreen(),
                ),

                navButton(
                  context,
                  Icons.settings,
                  false,
                  const SettingsScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}