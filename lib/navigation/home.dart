import 'package:empty/modules/home/screens/content_column.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () =>
            Navigator.pushNamed(context, '/reservations') as void Function(),
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            ContentColumn(
              title: 'Bienvenido',
              description: 'a mi aplicacion',
            ),
            ContentColumn(title: 'otra linea', description: 'segundo reglon'),
            ContentColumn(title: 'otra linea', description: 'tercer reglon'),
          ],
        ),
      ),
    );
  }
}
