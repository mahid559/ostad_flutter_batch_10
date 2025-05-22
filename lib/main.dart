import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FlagGridPage(),
    );
  }
}
class Country {
  final String name;
  final String fact;
  final String image;

  Country({required this.name, required this.fact, required this.image});
}

final List<Country> countries = [
  Country(name: "Bangladesh", fact: "Capital: Dhaka", image: "assets/bd.png"),
  Country(name: "Pakistan", fact: "Capital: Islamabad", image: "assets/pk.png"),
  Country(name: "France", fact: "Capital: Paris", image: "assets/fr.png"),
  Country(name: "Japan", fact: "Capital: Tokyo", image: "assets/jp.png"),
  Country(name: "Australia", fact: "Capital: Canberra", image: "assets/au.png"),
  Country(name: "USA", fact: "Capital: Washington D.C", image: "assets/us.png"),
];
class FlagGridPage extends StatelessWidget {
  const FlagGridPage({super.key});

  int getCrossAxisCount(double width) {
    if (width < 768) return 2;
    if (width < 1024) return 3;
    return 4;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = getCrossAxisCount(screenWidth);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flag Facts Grid'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: countries.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final country = countries[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Image.asset(
                    country.image,
                    height: 80,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    country.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    country.fact,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("View More"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
