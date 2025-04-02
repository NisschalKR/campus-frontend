import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DataScienceRoadmapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Science Roadmap'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Data Science Roadmap',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            
            // Step 1: Learn Programming
            RoadmapTile(title: 'Learn Programming (Python, R)', isFirst: true),
            
            // Step 2: Mathematics & Statistics
            RoadmapTile(title: 'Mathematics & Statistics'),

            // Step 3: Data Wrangling & Visualization
            RoadmapTile(title: 'Data Wrangling & Visualization'),

            // Step 4: Machine Learning
            RoadmapTile(title: 'Machine Learning'),

            // Step 5: Deep Learning
            RoadmapTile(title: 'Deep Learning'),

            // Step 6: Big Data & Cloud Computing
            RoadmapTile(title: 'Big Data & Cloud Computing'),

            // Step 7: Deploying ML Models
            RoadmapTile(title: 'Deploying ML Models', isLast: true),

            SizedBox(height: 20),
            Text(
              'Top Companies Hiring Data Scientists',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Company Logos
            CompanyTile(
              logoUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu6nIyp4FniYdPM6-vDQqjWx2GDgqZB-SOMA&s',
              companyName: 'Google',
              salary: 'Avg. Salary: \$120,000/year',
            ),
            CompanyTile(
              logoUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAE2DsdF6RJ3eiqVxPqVmsDix7QsIkFS_sVA&s',
              companyName: 'Amazon',
              salary: 'Avg. Salary: \$130,000/year',
            ),
            CompanyTile(
              logoUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFRWT-hcJ-f4BG_ugvMwfcUCMKFsfCaC3kaw&s',
              companyName: 'IBM',
              salary: 'Avg. Salary: \$115,000/year',
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
        iconStyle: IconStyle(iconData: Icons.check, color: Colors.white),
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
