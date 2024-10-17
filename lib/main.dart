import 'package:flutter/material.dart';
import './src/views/login.dart';
import './src/views/signup.dart';
import './src/views/menu.dart';
import './src/views/shopcart.dart';

import './src/controllers/users.dart';

void main() {
    signUp(users, tester);

    runApp(
        MaterialApp(

            home: const Login(),
            title: "Cleitin Lamxes",
            debugShowCheckedModeBanner: false,

            theme : ThemeData(
                primaryColor: Colors.blue,
            ),

            initialRoute: '/',
            routes: {
                '/signup': (context) => const SignUp(),
            }
        )
    );
}
