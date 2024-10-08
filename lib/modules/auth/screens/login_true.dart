import 'package:flutter/material.dart';

class LoginTrue extends StatefulWidget {
  const LoginTrue({super.key});

  @override
  State<LoginTrue> createState() => _LoginTrueState();
}

class _LoginTrueState extends State<LoginTrue> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _obscureText = true;

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
                  onPressed: () {
                    print('Email: ${_email.text}');
                    print('Password: ${_password.text}');
                  },
                  child: const Text('Iniciar sesión'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}