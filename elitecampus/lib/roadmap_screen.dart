import 'package:flutter/material.dart';

class RoadmapScreen extends StatelessWidget {
  final String domain;
  RoadmapScreen(this.domain);

  final Map<String, List<String>> roadmap = {
    "Frontend Developer": ["HTML & CSS", "JavaScript", "React/Vue/Angular", "State Management", "Performance Optimization", "Eligible: Frontend Dev"],
    "Backend Developer": ["Data Structures", "Node.js/Django", "Databases", "Microservices", "Security & Auth", "Eligible: Backend Dev"],
    "Data Scientist": ["Python & SQL", "Statistics", "Machine Learning", "Deep Learning", "Big Data", "Eligible: Data Scientist"],
    "Cybersecurity": ["Networking Basics", "Ethical Hacking", "Cloud Security", "Penetration Testing", "Incident Response", "Eligible: Cybersecurity Analyst"],
  };

  @override
  Widget build(BuildContext context) {
    List<String> steps = roadmap[domain] ?? [];
    
    return Scaffold(
      appBar: AppBar(title: Text('$domain Roadmap')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: steps.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: index == steps.length - 1 ? Colors.green : Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    steps[index],
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (index < steps.length - 1)
                  Icon(Icons.arrow_downward, color: Colors.grey, size: 30),
              ],
            );
          },
        ),
      ),
    );
  }
}
