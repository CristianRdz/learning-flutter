import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.all(16.0), // Add the required padding argument
                child: CircleAvatar(
                  backgroundImage: AssetImage('icon.png'),
                  radius: 20,
                ),
              ),
              Column(
                children: [
                  Text('Cristian Rodriguez',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text('Hace 5 minutos',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding:
                      EdgeInsets.all(16.0), // Add the required padding argument
                  child: Icon(Icons.more_vert),
                ),
              )),
            ],
          ),
          Image.asset('portada.png', width: double.infinity, height: 300),
          const Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.all(16.0), // Add the required padding argument
                child: Icon(Icons.favorite),
              ),
              Padding(
                padding:
                    EdgeInsets.all(16.0), // Add the required padding argument
                child: Icon(Icons.comment),
              ),
              Padding(
                padding:
                    EdgeInsets.all(16.0), // Add the required padding argument
                child: Icon(Icons.send),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: EdgeInsets.all(
                        16.0), // Add the required padding argument
                    child: Icon(Icons.save)),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
