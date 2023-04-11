import 'dart:async';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

String getGreeting() {
  var now = DateTime.now();
  var hour = now.hour;
  if (hour < 12) {
    return "Good Morning";
  } else {
    return "Good Afternoon";
  }
}

class _HomeViewState extends State<HomeView> {
  String greeting = getGreeting();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        greeting = getGreeting();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.greenAccent.withOpacity(0),
                  Colors.greenAccent.withOpacity(0.2),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              const SizedBox(width: 10),
              Text(
                greeting,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.notifications_active_outlined),
              const SizedBox(width: 10),
              const Icon(Icons.history),
              const SizedBox(width: 10),
              const Icon(Icons.settings),
              const SizedBox(width: 10)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Wrap(
                spacing: 10,
                children: [
                  Chip(
                    label: const Text("Music"),
                    onDeleted: () {
                      // TODO: Implement filter action
                    },
                  ),
                  Chip(
                    label: const Text("Podcast"),
                    onDeleted: () {
                      // TODO: Implement filter action
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
