import 'features/current_trip/CurrentTripScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Apolo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> body = [
    const CurrentTripScreen(),
    const Icon(Icons.history),
    const Icon(Icons.linear_scale_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(label: 'Поездка', icon: Icon(Icons.route)),
          BottomNavigationBarItem(label: 'История', icon: Icon(Icons.history)),
          BottomNavigationBarItem(
              label: 'Подключение', icon: Icon(Icons.linear_scale_rounded))
        ],
      ),
    );
  }
}
