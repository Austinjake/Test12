import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookie Clicker',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: CookieClickerApp(),
    );
  }
}

class CookieClickerApp extends StatefulWidget {
  @override
  _CookieClickerAppState createState() => _CookieClickerAppState();
}

class _CookieClickerAppState extends State<CookieClickerApp> {
  int points = 0;
  int level = 1;

  void _clickCookie() {
    setState(() {
      points += 1;
      if (points >= Random().nextInt(5) + 5) { // Random level-up threshold
        level++;
        points = 0; // Reset points after leveling up
        _showLevelUpDialog();
      }
    });
  }

  void _showLevelUpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Level Up!'),
        content: Text('Congratulations! You\'ve leveled up to Level $level!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cookie Clicker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _clickCookie,
              child: Image.network(
                'https://images.unsplash.com/photo-1598796800010-458f839ec22c', // Dog with glasses image
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text('Points: $points', style: TextStyle(fontSize: 24)),
            Text('Level: $level', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
