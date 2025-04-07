import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'career_roadmap_screen.dart';
import 'lost_found_screen.dart';

void main() {
  runApp(EliteCampusApp());
}

class EliteCampusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elite Campus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

// ------------------- SPLASH SCREEN -------------------
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Elite Campus',
              style: GoogleFonts.federo(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ).animate().fade(duration: 1200.ms).scale(),
            SizedBox(height: 10),
            Text(
              'Empowering Future Innovators',
              style: GoogleFonts.federo(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ).animate().fade(duration: 1500.ms).slideY(),
          ],
        ),
      ),
    );
  }
}

// ------------------- HOME SCREEN -------------------
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [HomePage(), CareerRoadmapScreen(), LostFoundScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Career Roadmap',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Lost & Found',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

// ------------------- HOME PAGE WITH NEWS API -------------------
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _news = [];
  bool _isLoading = true;
  final String apiKey = 'c472b3e3177042b6a38183dd0e290bd8'; // Replace with your NewsAPI key
  final String apiUrl =
      'https://newsapi.org/v2/everything?q=(software development OR artificial intelligence OR data science OR cybersecurity OR cloud computing OR mechanical engineering OR electrical engineering OR civil engineering OR manufacturing technology)&language=en&sortBy=publishedAt&apiKey=';

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(apiUrl + apiKey));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _news = data['articles'];
          _isLoading = false;
        });
      } else {
        print('Failed to load news. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching news: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Elite Campus News',
          style: GoogleFonts.federo(),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: _news.length,
              itemBuilder: (context, index) {
                return NewsCard(
                  title: _news[index]['title'] ?? 'No Title',
                  description: _news[index]['description'] ?? 'No Description',
                  imageUrl: _news[index]['urlToImage'] ?? '',
                );
              },
            ),
    );
  }
}

// ------------------- FIXED NEWS CARD WIDGET -------------------
class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  NewsCard({required this.title, required this.description, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    String validImageUrl = (imageUrl.isNotEmpty && Uri.tryParse(imageUrl)?.hasAbsolutePath == true)
        ? imageUrl
        : 'https://via.placeholder.com/400x200.png?text=No+Image'; // Placeholder if image is invalid

    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              validImageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) => Container(
                height: 200,
                color: Colors.grey[300],
                child: Center(
                  child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.federo(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.federo(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
