import 'dart:math';
import 'package:flutter/material.dart';
import 'tracking_screen.dart';
import 'history_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double progress = 0.0;
  bool holding = false;
  bool loading = false;

  String statusText =
      "Searching nearest ambulance...";
  String assignedType = "";

  final BoxDecoration cardStyle =
  BoxDecoration(
    color: Colors.white,
    borderRadius:
    BorderRadius.circular(20),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 8,
        offset: Offset(0, 3),
      ),
    ],
  );

  void startHold() async {
    if (holding || loading) return;

    holding = true;
    progress = 0.0;

    while (holding &&
        progress < 1.0) {
      await Future.delayed(
        const Duration(
            milliseconds: 100),
      );

      if (!mounted) return;

      setState(() {
        progress += 0.02;
      });
    }

    if (progress >= 1.0) {
      startSmartBooking();
    }
  }

  void stopHold() {
    holding = false;

    if (mounted &&
        !loading) {
      setState(() {
        progress = 0.0;
      });
    }
  }

  Future<void>
  startSmartBooking() async {
    setState(() {
      loading = true;
      progress = 0.0;
      statusText =
      "Searching nearest ambulance...";
      assignedType = "";
    });

    await Future.delayed(
      const Duration(seconds: 2),
    );

    final rnd =
    Random().nextInt(100);

    if (rnd < 60) {
      setState(() {
        statusText =
        "Nearest ambulance found";
        assignedType =
        "🚑 Ambulance Assigned";
      });
    } else if (rnd < 85) {
      setState(() {
        statusText =
        "No ambulance nearby";
        assignedType =
        "🚓 Government Unit Assigned";
      });
    } else {
      setState(() {
        statusText =
        "No official unit nearby";
        assignedType =
        "🙋 Volunteer Assigned";
      });
    }

    await Future.delayed(
      const Duration(seconds: 2),
    );

    setState(() {
      statusText =
      "Notifying emergency contact...";
    });

    await Future.delayed(
      const Duration(seconds: 1),
    );

    setState(() {
      statusText =
      "Opening live tracking...";
    });

    await Future.delayed(
      const Duration(seconds: 1),
    );

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
        const TrackingScreen(),
      ),
    );

    setState(() {
      loading = false;
      assignedType = "";
      statusText =
      "Searching nearest ambulance...";
    });
  }

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

  Widget infoCard(
      IconData icon,
      String title,
      String subtitle,
      Color color,
      ) {
    return Container(
      margin:
      const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      padding:
      const EdgeInsets.all(16),
      decoration: cardStyle,
      child: Row(
        children: [

          CircleAvatar(
            radius: 22,
            backgroundColor:
            color.withOpacity(
                0.12),
            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(
              width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,
              children: [

                Text(
                  title,
                  style:
                  const TextStyle(
                    fontSize: 15,
                    fontWeight:
                    FontWeight
                        .bold,
                  ),
                ),

                const SizedBox(
                    height: 4),

                Text(
                  subtitle,
                  style:
                  const TextStyle(
                    fontSize: 13,
                    color:
                    Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(
      BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color(
          0xfff7f7f7),

      appBar: AppBar(
        backgroundColor:
        Colors.red,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Vita Rescue",
          style: TextStyle(
            fontWeight:
            FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding:
            EdgeInsets.only(
                right: 15),
            child: Icon(
              Icons.person,
            ),
          )
        ],
      ),

      body: Stack(
        children: [

          Column(
            children: [

              const SizedBox(
                  height: 18),

              infoCard(
                Icons.location_on,
                "Current Location",
                "Raipur, India",
                Colors.red,
              ),

              const SizedBox(
                  height: 12),

              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(
                      context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Calling Emergency Contact...",
                      ),
                    ),
                  );
                },
                child: infoCard(
                  Icons.call,
                  "Emergency Contact",
                  "Mom • Tap to Call",
                  Colors.green,
                ),
              ),

              const SizedBox(
                  height: 32),

              const Text(
                "Emergency Help in Seconds",
                style:
                TextStyle(
                  fontSize: 22,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(
                  height: 8),

              const Text(
                "Press and hold SOS to request help",
                style:
                TextStyle(
                  fontSize: 13,
                  color:
                  Colors.grey,
                ),
              ),

              const SizedBox(
                  height: 28),

              GestureDetector(
                onTapDown:
                    (_) =>
                    startHold(),
                onTapUp:
                    (_) =>
                    stopHold(),
                onTapCancel:
                stopHold,
                child:
                Stack(
                  alignment:
                  Alignment
                      .center,
                  children: [

                    SizedBox(
                      width:
                      255,
                      height:
                      255,
                      child:
                      CircularProgressIndicator(
                        value:
                        progress,
                        strokeWidth:
                        10,
                        backgroundColor:
                        const Color(
                            0xfff2d1d1),
                        valueColor:
                        const AlwaysStoppedAnimation<
                            Color>(
                          Colors.red,
                        ),
                      ),
                    ),

                    Container(
                      width:
                      220,
                      height:
                      220,
                      decoration:
                      const BoxDecoration(
                        color: Colors
                            .red,
                        shape: BoxShape
                            .circle,
                      ),
                      child:
                      const Center(
                        child:
                        Text(
                          "SOS",
                          style:
                          TextStyle(
                            color: Colors
                                .white,
                            fontSize:
                            48,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Container(
                padding:
                const EdgeInsets.symmetric(
                  vertical:
                  15,
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
                child:
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
                  children: [

                    navButton(
                      context,
                      Icons.home,
                      true,
                      const HomeScreen(),
                    ),

                    navButton(
                      context,
                      Icons.location_pin,
                      false,
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

          if (loading)
            Container(
              color: Colors
                  .black54,
              child:
              Center(
                child:
                Container(
                  margin:
                  const EdgeInsets.symmetric(
                    horizontal:
                    28,
                  ),
                  padding:
                  const EdgeInsets.all(
                      24),
                  decoration:
                  BoxDecoration(
                    color: Colors
                        .white,
                    borderRadius:
                    BorderRadius.circular(
                        20),
                  ),
                  child:
                  Column(
                    mainAxisSize:
                    MainAxisSize.min,
                    children: [

                      const CircularProgressIndicator(
                        color:
                        Colors.red,
                      ),

                      const SizedBox(
                          height:
                          18),

                      Text(
                        statusText,
                        textAlign:
                        TextAlign.center,
                        style:
                        const TextStyle(
                          fontSize:
                          16,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                          height:
                          12),

                      if (assignedType
                          .isNotEmpty)
                        Text(
                          assignedType,
                          textAlign:
                          TextAlign.center,
                          style:
                          const TextStyle(
                            fontSize:
                            18,
                            color: Colors.green,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}