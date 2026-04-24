import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'tracking_screen.dart';
import 'history_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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

  Widget tile(
      BuildContext context,
      IconData icon,
      String title,
      String subtitle,
      Color color,
      ) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(
          SnackBar(
            content:
            Text("$title clicked"),
          ),
        );
      },
      child: Container(
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
          boxShadow: const [
            BoxShadow(
              color:
              Colors.black12,
              blurRadius: 8,
              offset:
              Offset(0, 3),
            ),
          ],
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

            const Icon(
              Icons
                  .arrow_forward_ios,
              size: 15,
              color: Colors.grey,
            ),
          ],
        ),
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
          "Profile & Settings",
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

            Container(
              padding:
              const EdgeInsets.all(
                  18),
              decoration:
              BoxDecoration(
                color:
                Colors.white,
                borderRadius:
                BorderRadius.circular(
                    20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors
                        .black12,
                    blurRadius:
                    8,
                    offset:
                    Offset(
                        0,
                        3),
                  ),
                ],
              ),
              child: Column(
                children: [

                  const CircleAvatar(
                    radius: 36,
                    backgroundColor:
                    Colors.red,
                    child: Icon(
                      Icons.person,
                      color: Colors
                          .white,
                      size: 38,
                    ),
                  ),

                  const SizedBox(
                      height: 12),

                  const Text(
                    "Ayush",
                    style:
                    TextStyle(
                      fontSize: 20,
                      fontWeight:
                      FontWeight
                          .bold,
                    ),
                  ),

                  const SizedBox(
                      height: 4),

                  const Text(
                    "Emergency User",
                    style:
                    TextStyle(
                      color:
                      Colors.grey,
                    ),
                  ),

                  const SizedBox(
                      height: 14),

                  SizedBox(
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
                            content:
                            Text(
                              "Edit Profile Clicked",
                            ),
                          ),
                        );
                      },
                      icon:
                      const Icon(
                        Icons.edit,
                        color: Colors
                            .white,
                      ),
                      label:
                      const Text(
                        "Edit Profile",
                        style:
                        TextStyle(
                          color: Colors
                              .white,
                        ),
                      ),
                      style:
                      ElevatedButton.styleFrom(
                        backgroundColor:
                        Colors.red,
                        padding:
                        const EdgeInsets.symmetric(
                          vertical:
                          13,
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
                ],
              ),
            ),

            const SizedBox(
                height: 18),

            tile(
              context,
              Icons.call,
              "Emergency Contact",
              "Mom • +91 XXXXXXX",
              Colors.green,
            ),

            tile(
              context,
              Icons.bloodtype,
              "Blood Group",
              "O+ Positive",
              Colors.red,
            ),

            tile(
              context,
              Icons.location_on,
              "Saved Address",
              "Raipur, India",
              Colors.orange,
            ),

            tile(
              context,
              Icons.language,
              "Language",
              "English",
              Colors.blue,
            ),

            tile(
              context,
              Icons.notifications,
              "Notifications",
              "Enabled",
              Colors.purple,
            ),

            tile(
              context,
              Icons.security,
              "Permissions",
              "Location & Calls",
              Colors.teal,
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
              false,
              const HistoryScreen(),
            ),

            navButton(
              context,
              Icons.settings,
              true,
              const SettingsScreen(),
            ),
          ],
        ),
      ),
    );
  }
}