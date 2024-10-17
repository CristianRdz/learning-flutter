import 'package:empty/kernel/widgets/text_form_field_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuenta'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('icon.png'),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'ejemplo',
                      label: Text('Correo electrónico'),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    validator: (value) {
                      if (value!.isEmpty &&
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                        return 'Por favor, ingrese su correo electrónico';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFieldPassword(
                    hintText: '...',
                    labelText: 'Contraseña',
                    controller: _password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese su contraseña';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFieldPassword(
                    hintText: '...',
                    labelText: 'Confirmar contraseña',
                    controller: _confirmPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, confirme su contraseña';
                      }
                      if (value != _password.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
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
                        if (_formKey.currentState!.validate()) {
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: _email.text,
                              password: _password.text,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Registro exitoso')),
                            );
                          } on FirebaseAuthException catch (e) {
                            String message;
                            if (e.code == 'user-not-found') {
                              message = 'No user found for that email.';
                            } else if (e.code == 'wrong-password') {
                              message =
                                  'Wrong password provided for that user.';
                            } else {
                              message = e.code;
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(message)),
                            );
                          }
                        }
                      },
                      child: const Text('Registrarse'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
