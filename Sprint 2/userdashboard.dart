import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, int> activities = {
      'Leadership': 15,
      'Career': 4,
      'Award': 2,
      'Cultural': 6,
      'Academic': 6,
      'Volunteer': 2,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Eventory',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle the "Edit" button press in the app bar
                // You can add code here to perform actions on edit
              },
              child: Text(
                '',
                style: TextStyle(color: Colors.red),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('image/spon.webp'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'LEE MIN HO',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _buildActivitiesList(activities),
            SizedBox(height: 20),
            _buildPieChart(activities),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Total Activities: ${activities.values.reduce((a, b) => a + b)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // Add other widgets here as needed
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 24),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner, size: 24),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 24),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 24),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          // Handle navigation based on the index
          switch (index) {
            case 0:
              // Handle the "Home" button press
              break;
            case 1:
              // Handle the "Search" button press
              break;
            case 2:
              // Handle the "Scan" button press
              break;
            case 3:
              // Handle the "Notification" button press
              break;
            case 4:
              // Handle the "Profile" button press
              break;
          }
        },
      ),
    );
  }

  Widget _buildActivitiesList(Map<String, int> activities) {
    List<Widget> activityWidgets = [];

    activities.forEach((activity, count) {
      activityWidgets.add(_buildRowWithCounts(activity, count));
    });

    return Center(
      child: Column(
        children: activityWidgets,
      ),
    );
  }

  Widget _buildRowWithCounts(String title, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          Text(
            count.toString(),
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildPieChart(Map<String, int> activities) {
    return SizedBox(
      height: 300,
      child: CustomPaint(
        size: Size(300, 300),
        painter: PieChartPainter(activities),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final Map<String, int> data;

  PieChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    double total = 0.0;
    data.forEach((_, value) {
      total += value;
    });

    Paint paint = Paint()..style = PaintingStyle.fill;

    double startAngle = 0.0;
    data.forEach((category, value) {
      final double sweepAngle = (value / total) * 360;
      paint.color = Color((category.hashCode & 0xFFFFFF) | 0xFF000000);
      canvas.drawArc(
        Rect.fromLTWH(0, 0, size.width, size.height),
        radians(startAngle),
        radians(sweepAngle),
        true,
        paint,
      );

      // Calculate the angle for the text label
      final angle = radians(startAngle + (sweepAngle / 2));

      // Calculate text position inside the pie chart segment
      final textX = (size.width / 2) + (size.width / 3 * cos(angle));
      final textY = (size.height / 2) + (size.height / 3 * sin(angle));

      // Draw text label
      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: category,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      textPainter.paint(canvas, Offset(textX - textPainter.width / 2, textY - textPainter.height / 2));

      startAngle += sweepAngle;
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double radians(double degrees) {
    return degrees * (pi / 180);
  }
}
