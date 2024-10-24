import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empty/modules/home/entities/restaurant.dart';
import 'package:empty/modules/home/screens/content_column.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final db = FirebaseFirestore.instance;
  List<Restaurant> restaurants = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRestaurants();
  }

  Future<void> _fetchRestaurants() async {
    try {
      final data = await db.collection('restaurants').get();
      final fetchedRestaurants = data.docs.map((element) {
        return Restaurant(
          element['name'],
          element['description'],
          List<String>.from(element['images']),
          element['rating'],
          element['count'],
        );
      }).toList();

      setState(() {
        restaurants = fetchedRestaurants;
        isLoading = false;
      });
    } catch (e) {
      // Handle errors here
      print('Error fetching restaurants: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          // Implement the action for the FloatingActionButton here
        },
        child: const Icon(Icons.star_rate),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Row(
        children: [
          Image.network(
            restaurants[0].images[0],
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              SizedBox(width: 16),
              Text(
                restaurants[0].name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
                child: Text(
                  restaurants[0].description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
