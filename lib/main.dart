import 'package:flutter/material.dart';
import 'views/home_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab-08',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color(0xFF02BB9F),
          primaryColorDark: const Color(0xFF167F67)),
      home: const HomePage(title: 'Lab-08'),
    );
  }
}
