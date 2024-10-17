import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginTrue extends StatefulWidget {
  const LoginTrue({super.key});

  @override
  State<LoginTrue> createState() => _LoginTrueState();
}

class _LoginTrueState extends State<LoginTrue> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  bool _loading = false;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('icon.png'),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'ejemplo@gmail.com',
                  label: Text('Correo electrónico'),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: _email,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: '...',
                  icon: const Icon(Icons.lock),
                  label: const Text('Contraseña'),
                  labelStyle: const TextStyle(color: Colors.black),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                controller: _password,
                obscureText: _obscureText,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () async {
                    try {
                      setState(() {
                        _loading = true;
                      });
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: _email.text,
                        password: _password.text,
                      );
                      setState(() {
                        _loading = false;
                      });
                      _showSnackBar('Inicio de sesión exitoso');
                      print(credential.user ?? 'No user');
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        _loading = false;
                      });
                      if (e.code == 'user-not-found') {
                        _showSnackBar('No user found for that email.');
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        _showSnackBar('Wrong password provided for that user.');
                        print('Wrong password provided for that user.');
                      } else {
                        _showSnackBar('Error: ${e.code}');
                        print(e.code);
                      }
                    }
                  },
                  child: const Text('Iniciar sesión'),
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text(
                  'Registrarse',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
