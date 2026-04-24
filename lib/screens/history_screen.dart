import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'tracking_screen.dart';
import 'settings_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

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
            builder: (_) => page,
          ),
        );
      },
      icon: Icon(
        icon,
        size: 28,
        color:
        active ? Colors.red : Colors.grey,
      ),
    );
  }

  Widget historyTile(
      IconData icon,
      Color color,
      String title,
      String subtitle,
      String status,
      ) {
    return Container(
      margin:
      const EdgeInsets.only(
          bottom: 12),
      padding:
      const EdgeInsets.all(15),
      decoration:
      BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(
            18),
      ),
      child: Row(
        children: [

          CircleAvatar(
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
                    fontWeight:
                    FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(
                    height: 4),

                Text(
                  subtitle,
                  style:
                  const TextStyle(
                    color:
                    Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          Text(
            status,
            style: TextStyle(
              color: color,
              fontWeight:
              FontWeight.bold,
              fontSize: 13,
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
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "History",
          style: TextStyle(
            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),

      body:
      SingleChildScrollView(
        padding:
        const EdgeInsets.all(
            16),
        child: Column(
          children: [

            historyTile(
              Icons.local_hospital,
              Colors.green,
              "Ambulance Assigned",
              "Today • 09:45 PM",
              "Completed",
            ),

            historyTile(
              Icons.local_police,
              Colors.blue,
              "Government Unit Assigned",
              "Yesterday • 08:20 PM",
              "Completed",
            ),

            historyTile(
              Icons.volunteer_activism,
              Colors.orange,
              "Volunteer Responder",
              "22 Apr • 06:10 PM",
              "Completed",
            ),

            historyTile(
              Icons.warning,
              Colors.red,
              "Emergency Request",
              "19 Apr • 01:35 PM",
              "Cancelled",
            ),

            historyTile(
              Icons.local_hospital,
              Colors.green,
              "Ambulance Assigned",
              "16 Apr • 10:00 AM",
              "Completed",
            ),
          ],
        ),
      ),

      bottomNavigationBar:
      Container(
        padding:
        const EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration:
        const BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.vertical(
            top: Radius.circular(
                25),
          ),
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment
              .spaceAround,
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
              false,
              const TrackingScreen(),
            ),

            navButton(
              context,
              Icons.history,
              true,
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
    );
  }
}