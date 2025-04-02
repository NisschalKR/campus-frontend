import 'package:flutter/material.dart';
import 'fullstack_roadmap_screen.dart';
import 'data_science_roadmap_screen.dart';
import 'cybersecurity_roadmap_screen.dart';
import 'cloud_roadmap_screen.dart';

class CareerRoadmapScreen extends StatelessWidget {
  final List<Map<String, dynamic>> careerDomains = [
    {
      'title': 'Full Stack Developer',
      'icon': Icons.code,
      'screen': FullStackRoadmapScreen(), // Make sure this class name matches the actual file
    },
    {
      'title': 'Data Science',
      'icon': Icons.bar_chart,
      'screen': DataScienceRoadmapPage(), // Match class name
    },
    {
      'title': 'Cybersecurity',
      'icon': Icons.security,
      'screen': CyberSecurityRoadmapPage(), // Match class name
    },
    {
      'title': 'Cloud Computing',
      'icon': Icons.cloud,
      'screen':  CloudComputingPage(), // Match class name
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Career Roadmap'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: careerDomains.length,
          itemBuilder: (context, index) {
            final domain = careerDomains[index];
            return _buildDomainButton(
              context,
              domain['title'],
              domain['icon'],
              domain['screen'],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDomainButton(BuildContext context, String title, IconData icon, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(icon, size: 32, color: Colors.blue),
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          },
        ),
      ),
    );
  }
}
