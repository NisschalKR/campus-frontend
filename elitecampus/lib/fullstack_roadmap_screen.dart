import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class FullStackRoadmapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Stack Developer Roadmap'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          _buildTimelineTile(true, 'Learn HTML, CSS, JavaScript', 'Frontend Basics', Icons.code),
          _buildTimelineTile(false, 'Master Frontend Frameworks', 'React, Vue, or Angular', Icons.web),
          _buildTimelineTile(false, 'Understand Backend', 'Node.js, Django, or Spring Boot', Icons.storage),
          _buildTimelineTile(false, 'Learn Databases', 'SQL (PostgreSQL, MySQL) & NoSQL (MongoDB)', Icons.storage),
          _buildTimelineTile(false, 'Build & Deploy Apps', 'CI/CD, Docker, AWS, Firebase', Icons.cloud),
          _buildTimelineTile(false, 'Apply for Jobs', 'Top Companies Hiring', Icons.work, isFinal: true),
          _buildCompanySection(),
        ],
      ),
    );
  }

  Widget _buildTimelineTile(bool isFirst, String title, String subtitle, IconData icon, {bool isFinal = false}) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isFinal,
      indicatorStyle: IndicatorStyle(width: 30, color: Colors.blue),
      beforeLineStyle: LineStyle(color: Colors.blue, thickness: 3),
      endChild: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          leading: Icon(icon, color: Colors.blue, size: 30),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }

  Widget _buildCompanySection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Hiring Companies', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCompanyLogo('assets/google.png', 'Google'),
              _buildCompanyLogo('assets/meta.png', 'Meta'),
              _buildCompanyLogo('assets/amazon11.png', 'Amazon'),
              _buildCompanyLogo('assets/microsoft.png', 'Microsoft'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyLogo(String assetPath, String companyName) {
    return Column(
      children: [
        Image.asset(assetPath, width: 50),
        SizedBox(height: 5),
        Text(companyName, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
