import 'package:flutter/material.dart';
import 'package:temperaturapps/home.dart';
import 'package:temperaturapps/setting.dart';

class SmartHomePage extends StatefulWidget {
  @override
  _SmartHomePageState createState() => _SmartHomePageState();
}

class _SmartHomePageState extends State<SmartHomePage> {
  bool isAirOn = true;
  bool isTvOn = false;
  bool isRouterOn = true;
  bool isLightOn = false;
  double airConditionerTemp = 24.0;
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      switch (index) {
        case 0:
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LivingRoomPage()));
          break;
        case 2:
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SettingPage()));
          break;
      }
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
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            'Living Room',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                      Text('Just Updated', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                  Text(
                    '${airConditionerTemp.toInt()}°C',
                    style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildDeviceTile(Icons.tv, 'Smart TV', 'Philips 5-DBI 4K', isTvOn, (val) {
                      setState(() {
                        isTvOn = val;
                      });
                    }),
                    _buildDeviceTile(Icons.ac_unit, 'Air', 'Panasonic F-154', isAirOn, (val) {
                      setState(() {
                        isAirOn = val;
                      });
                    }, highlight: true),
                    _buildDeviceTile(Icons.router, 'Router', 'TP-Link 847', isRouterOn, (val) {
                      setState(() {
                        isRouterOn = val;
                      });
                    }),
                    _buildDeviceTile(Icons.lightbulb, 'Light Bulb', 'Philips HUE 2.0', isLightOn, (val) {
                      setState(() {
                        isLightOn = val;
                      });
                    }),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('Air Conditioner',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent)),
              Text('Panasonic F-154', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('${airConditionerTemp.toInt()}°C',
                        style: TextStyle(
                            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: Slider(
                      value: airConditionerTemp,
                      min: 16,
                      max: 30,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey,
                      divisions: 14,
                      onChanged: (value) {
                        setState(() {
                          airConditionerTemp = value;
                        });
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget _buildDeviceTile(IconData icon, String title, String subtitle, bool isOn, Function(bool) onChanged,
      {bool highlight = false}) {
    return Container(
      decoration: BoxDecoration(
        color: highlight && isOn ? Colors.blue.shade700 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: highlight && isOn ? Colors.white : Colors.black),
          SizedBox(height: 8),
          Text(title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: highlight && isOn ? Colors.white : Colors.black)),
          Text(subtitle,
              style: TextStyle(
                  fontSize: 12,
                  color: highlight && isOn ? Colors.white70 : Colors.grey)),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Switch(
              value: isOn,
              onChanged: onChanged,
              activeColor: Colors.white,
              activeTrackColor: Colors.lightBlueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
