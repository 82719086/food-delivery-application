import 'package:delivery/auth/login_or_register.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:delivery/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCywCKIEXbEA7z1drxQ2h4YggFz9ByPChs",
        authDomain: "delivery-6f195.firebaseapp.com",
        projectId: "delivery-6f195",
        storageBucket: "delivery-6f195.firebasestorage.app",
        messagingSenderId: "565874754233",
        appId: "1:565874754233:web:98b128e37196e9bb84d168",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(
    MultiProvider(
      providers: [
        //theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),

        //restaurant provider
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
