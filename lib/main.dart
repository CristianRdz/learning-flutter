import 'package:empty/modules/auth/screens/login_true.dart';
import 'package:empty/modules/auth/screens/login.dart';
import 'package:empty/modules/auth/screens/register.dart';
import 'package:empty/navigation/home.dart';
import 'package:empty/navigation/navigation.dart';
import 'package:empty/modules/home/screens/splash_screen.dart';
import 'package:empty/modules/profile/screens/profile.dart';
import 'package:empty/modules/reservations/screens/list.dart';
import 'package:empty/modules/top/screens/list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/menu',
      routes: {
        '/': (context) => const SplashScreen(),
        '/menu': (context) => const Navigation(),
        '/register': (context) => const Register(),
        '/login': (context) => const LoginTrue(),
        '/home': (context) => const Home(),
        '/top': (context) => const TopFiveScreen(),
        '/reservations': (context) => const ReservationListScreen(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}
