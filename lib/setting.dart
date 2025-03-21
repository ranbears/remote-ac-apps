import 'package:flutter/material.dart';
import 'package:temperaturapps/detail.dart';
import 'package:temperaturapps/home.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      switch (index) {
        case 0:
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LivingRoomPage()));
          break;
        case 1:
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SmartHomePage()));
          break;
        case 2:
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32.0),
            ListTile(
              leading: const Icon(Icons.person, size: 50),
              title: const Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('blabla@gmail.com'),
                  Text('081626221271'),
                ],
              ),
              trailing: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 65,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            _buildSettingOption(Icons.lock, 'Ubah Password', () {}),
            _buildSettingOption(Icons.policy, 'Kebijakan Privasi', () {}),
            _buildSettingOption(Icons.description, 'Ketentuan Layanan', () {}),
            _buildSettingOption(Icons.support_agent, 'Whatsapp Admin', () {}),
            const SizedBox(height: 16.0),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Keluar',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {},
            ),
            const Spacer(),
            const Center(
              child: Text(
                'Version V 1.3.6',
                style: TextStyle(color: Colors.grey),
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
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildSettingOption(IconData icon, String title, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 20),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}