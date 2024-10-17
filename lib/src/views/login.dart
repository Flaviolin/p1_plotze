// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import './repassword.dart';
import './signup.dart';
import './menu.dart';
import './about.dart';

import './../controllers/users.dart';

class Login extends StatefulWidget {
    const Login({super.key});

    @override
    State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    var txtEmail = TextEditingController();
    var txtPassword = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Stack(
                children: [
                    Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 80),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                Expanded(
                                    flex: 1,
                                    child: login(),
                                ),
                            ],
                        ),
                    ),
                ]
            )
        );
    }

    showMessage(m) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(seconds: 3), content: Text(m)));
    }

    login() {
        return Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: const BoxDecoration(
            ),

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Image.asset('logo.png', height: 200,),

                    TextField(
                        controller: txtEmail,
                        decoration: const InputDecoration(
                            labelText: "E-mail",
                            border: OutlineInputBorder(),
                        ),
                    ),

                    TextField(
                        controller: txtPassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: "Senha",
                            border: OutlineInputBorder(),
                        ),
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(),
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Repassword())),
                                child: Text(
                                    "Esqueceu a senha?", style: const TextStyle(fontSize: 12),
                                )
                            )
                        ]
                    ),
                    const SizedBox(height: 30),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(),
                                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp())),
                                        child: const Text(
                                            "Cadastrar", style: TextStyle(fontSize: 20),
                                        )
                                    )
                                ]
                            ),
                            const SizedBox(width: 20),

                            ElevatedButton(
                                onPressed: () {
                                    if (authUser(users, txtEmail.text, txtPassword.text)) {
                                        Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => Menu()));
                                        txtEmail.clear();
                                        txtPassword.clear();
                                    } 
                                    else {
                                        showMessage("Preencha o e-mail e a senha corretamente para entrar");
                                    }
                                },
                                child: const Text(
                                    "Entrar", style: TextStyle(fontSize: 20),
                                )
                            )
                        ]
                    ),
                ]
            )
        );
    }
}

