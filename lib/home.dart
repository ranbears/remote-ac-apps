import 'package:flutter/material.dart';
import 'package:temperaturapps/detail.dart';
import 'package:temperaturapps/setting.dart';

class LivingRoomPage extends StatefulWidget {
  @override
  _LivingRoomPageState createState() => _LivingRoomPageState();
}

class _LivingRoomPageState extends State<LivingRoomPage> {
  double _temperature = 24.0;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SmartHomePage()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade300, 
              Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Living Room",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const Icon(Icons.power_settings_new,
                            color: Colors.redAccent, size: 32),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Access your devices from any room",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${_temperature.toInt()}",
                                  style: const TextStyle(
                                      fontSize: 70,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Column(
                                    children: [
                                      Icon(Icons.circle,
                                          size: 14, color: Colors.white),
                                      Text(
                                        "C",
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "${_temperature.toInt()}°C Outside",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(width: 40),
                        Container(
                          width: 70,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                height: (_temperature / 30) * 300,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 54, 160, 247),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "${_temperature.toInt()}°C",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildModeButton(Icons.ac_unit, "Cooling"),
                            const SizedBox(height: 20),
                            _buildModeButton(Icons.access_time, "Timer"),
                            const SizedBox(height: 20),
                            _buildModeButton(Icons.bolt, "Turbo"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Slider(
                      value: _temperature,
                      min: 16,
                      max: 30,
                      divisions: 24,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.white38,
                      onChanged: (value) {
                        setState(() {
                          _temperature = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildModeButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 40),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.white)),
      ],
    );
  }
}
