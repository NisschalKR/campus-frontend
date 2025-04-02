import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CyberSecurityRoadmapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cyber Security Roadmap'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Cyber Security Roadmap',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            
            // Step 1: Learn Networking & OS
            RoadmapTile(title: 'Learn Networking & Operating Systems', isFirst: true),
            
            // Step 2: Security Fundamentals
            RoadmapTile(title: 'Understand Security Fundamentals'),

            // Step 3: Cryptography & Encryption
            RoadmapTile(title: 'Learn Cryptography & Encryption'),

            // Step 4: Ethical Hacking & Pen Testing
            RoadmapTile(title: 'Ethical Hacking & Penetration Testing'),

            // Step 5: Incident Response & Security Tools
            RoadmapTile(title: 'Incident Response & Security Tools'),

            // Step 6: Cloud Security & Compliance
            RoadmapTile(title: 'Cloud Security & Compliance'),

            // Step 7: Advanced Cyber Threat Intelligence
            RoadmapTile(title: 'Advanced Cyber Threat Intelligence', isLast: true),

            SizedBox(height: 20),
            Text(
              'Top Companies Hiring Cyber Security Experts',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Company Logos
            CompanyTile(
              logoUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu6nIyp4FniYdPM6-vDQqjWx2GDgqZB-SOMA&s',
              companyName: 'Google',
              salary: 'Avg. Salary: \$130,000/year',
            ),
            CompanyTile(
              logoUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAE2DsdF6RJ3eiqVxPqVmsDix7QsIkFS_sVA&s',
              companyName: 'Amazon Security Team',
              salary: 'Avg. Salary: \$140,000/year',
            ),
            CompanyTile(
              logoUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqHxfp5_IxQLcw1D8CVTi6ouBWcTy2m6sxHw&s',
              companyName: 'Cisco',
              salary: 'Avg. Salary: \$120,000/year',
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Roadmap Step
class RoadmapTile extends StatelessWidget {
  final String title;
  final bool isFirst;
  final bool isLast;

  const RoadmapTile({
    required this.title,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 30,
        color: Colors.blue,
        iconStyle: IconStyle(iconData: Icons.security, color: Colors.white),
      ),
      beforeLineStyle: LineStyle(color: Colors.blue, thickness: 4),
      endChild: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Reusable Company Tile
class CompanyTile extends StatelessWidget {
  final String logoUrl;
  final String companyName;
  final String salary;

  const CompanyTile({
    required this.logoUrl,
    required this.companyName,
    required this.salary,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(logoUrl, width: 50, height: 50),
        title: Text(companyName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(salary),
      ),
    );
  }
}
