import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_slider/gradient_slider.dart';

import '../utils/imports_home.dart';

enum RoomTypes { all, living, bed, kitchen }

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RoomTypes selectedRoom = RoomTypes.all;
  Map<String, bool?> onDevices = {};
  double seekTime = .23;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              transform: GradientRotation(pi * .4),
              colors: [
                Color.fromARGB(255, 229, 227, 238),
                Color.fromARGB(255, 163, 157, 201),
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Manage Home",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text.rich(
                      TextSpan(
                        text: "Hey, ",
                        children: [
                          TextSpan(
                            text: "Gautam",
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ],
                        style: TextStyle(
                          fontSize: 34,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(59),
                      child: Image.asset(
                        "assets/images/profiles/me.jpg",
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white.withOpacity(.8),
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      SizedBox(width: 10),
                      StatusItem(
                        iconData: CupertinoIcons.sun_max_fill,
                        iconColor: Colors.blue,
                        title: "motion",
                        value: "75%",
                      ),
                      StatusDivider(),
                      StatusItem(
                        iconData: Icons.energy_savings_leaf,
                        iconColor: Colors.indigo,
                        title: "energy",
                        value: "75%",
                      ),
                      StatusDivider(),
                      StatusItem(
                        iconData: CupertinoIcons.thermometer,
                        iconColor: Colors.orange,
                        title: "temp",
                        value: "24℃",
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 20),
                    RoomChip(
                      title: "All",
                      onTap: () {
                        setState(() {
                          selectedRoom = RoomTypes.all;
                        });
                      },
                      isSelected: selectedRoom == RoomTypes.all,
                    ),
                    RoomChip(
                      title: "Living Room",
                      onTap: () {
                        setState(() {
                          selectedRoom = RoomTypes.living;
                        });
                      },
                      isSelected: selectedRoom == RoomTypes.living,
                    ),
                    RoomChip(
                      title: "Bedroom",
                      onTap: () {
                        setState(() {
                          selectedRoom = RoomTypes.bed;
                        });
                      },
                      isSelected: selectedRoom == RoomTypes.bed,
                    ),
                    RoomChip(
                      title: "Kitchen",
                      onTap: () {
                        setState(() {
                          selectedRoom = RoomTypes.kitchen;
                        });
                      },
                      isSelected: selectedRoom == RoomTypes.kitchen,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GridView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 210,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                children: [
                  DeviceCard(
                    activeColor: Colors.cyan,
                    isActive: onDevices['lights'] ?? false,
                    connectionIcon: Icons.wifi,
                    deviceIcon: Icons.light,
                    title: "Smart lightning",
                    subtitle: "Bedroom",
                    onActivePressed: (_) {
                      setState(() {
                        onDevices['lights'] = _;
                      });
                    },
                  ),
                  DeviceCard(
                    activeColor: Colors.brown,
                    isActive: onDevices['ac'] ?? false,
                    connectionIcon: Icons.bluetooth,
                    deviceIcon: Icons.air,
                    title: "Air Conditioner",
                    subtitle: "Living Room",
                    onActivePressed: (_) {
                      setState(() {
                        onDevices['ac'] = _;
                      });
                    },
                  ),
                  DeviceCard(
                    activeColor: Colors.orange,
                    isActive: onDevices['motion'] ?? false,
                    connectionIcon: Icons.bluetooth,
                    deviceIcon: Icons.directions_walk,
                    title: "Motion Sensors",
                    subtitle: "Kitchen",
                    onActivePressed: (_) {
                      setState(() {
                        onDevices['motion'] = _;
                      });
                    },
                  ),
                  DeviceCard(
                    activeColor: Colors.purple,
                    isActive: onDevices['deskLamp'] ?? false,
                    connectionIcon: Icons.wifi,
                    deviceIcon: Icons.desk,
                    title: "Desk Lamp",
                    subtitle: "Bedroom",
                    onActivePressed: (_) {
                      setState(() {
                        onDevices['deskLamp'] = _;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ColoredBox(color: Colors.white.withOpacity(.7)),
                      ),
                      Positioned.fill(
                        child: Image.asset(
                          "assets/images/pattern.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.white.withOpacity(.8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.speaker,
                                  size: 50,
                                  fill: 1,
                                  shadows: [
                                    Shadow(color: Colors.white, blurRadius: 10)
                                  ],
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: "Google",
                                    children: const [
                                      TextSpan(
                                        text: " home",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "\nPaused",
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                    style: TextStyle(
                                      color: Colors.orange.shade800,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Switch(
                                  activeColor: Colors.orange.shade800,
                                  value: onDevices['music'] ?? false,
                                  onChanged: (_) {
                                    setState(() {
                                      onDevices['music'] = _;
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            GradientSlider(
                              activeTrackGradient: const LinearGradient(
                                colors: [
                                  Colors.yellow,
                                  Colors.red,
                                ],
                              ),
                              thumbAsset: "seek",
                              slider: Slider(
                                thumbColor: Colors.red,
                                value: seekTime,
                                onChanged: (_) {
                                  setState(() {
                                    seekTime = _;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        bottom: 65,
                        left: 35,
                        child: Text(
                          "Skechers (Remix) (feat. Tyga)",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 35,
                        right: 35,
                        bottom: 15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Builder(builder: (context) {
                              int d = (seekTime * (164)).toInt();
                              return Text(
                                "${(d / 60).floor()}:${"${(d % 60)}".padLeft(2, '0')}",
                                style: const TextStyle(color: Colors.grey),
                              );
                            }),
                            const Text(
                              "2:44",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
