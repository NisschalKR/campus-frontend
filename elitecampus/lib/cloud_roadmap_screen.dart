import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CloudComputingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cloud Computing Roadmap'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Cloud Computing Roadmap',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Timeline for Cloud Computing
            CloudComputingRoadmap(),

            SizedBox(height: 30),
            Text(
              'Top Companies Hiring for Cloud Roles',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // High-Paying Companies Section
            CompanyLogos(),
          ],
        ),
      ),
    );
  }
}

// Timeline for Cloud Computing
class CloudComputingRoadmap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineStep(title: "Learn Linux Basics", isFirst: true),
        TimelineStep(title: "Understand Networking & Security"),
        TimelineStep(title: "Learn Cloud Platforms (AWS, Azure, GCP)"),
        TimelineStep(title: "Get Hands-on with Docker & Kubernetes"),
        TimelineStep(title: "Understand DevOps Practices"),
        TimelineStep(title: "Learn Infrastructure as Code (Terraform)"),
        TimelineStep(title: "Get Certified (AWS/Azure/GCP)", isLast: true),
      ],
    );
  }
}

// Reusable Timeline Step Widget
class TimelineStep extends StatelessWidget {
  final String title;
  final bool isFirst;
  final bool isLast;

  TimelineStep({required this.title, this.isFirst = false, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 20,
        color: Colors.blue,
      ),
      beforeLineStyle: LineStyle(
        color: Colors.blue,
        thickness: 4,
      ),
      endChild: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

// Company Logos Section
class CompanyLogos extends StatelessWidget {
  final List<String> companies = [
    'assets/aws1.png',
    'assets/google_cloud.png',
    'assets/microsoft_cloud.png',
    'assets/oracle_cloud.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: companies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(companies[index], width: 70),
          );
        },
      ),
    );
  }
}
