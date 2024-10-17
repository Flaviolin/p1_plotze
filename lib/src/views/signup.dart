// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'dart:math';

import './login.dart';

import './../controllers/users.dart';

import './../models/user.dart';

class SignUp extends StatefulWidget {
    const SignUp({super.key});

    @override
    State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
    var txtName = TextEditingController();
    var txtEmail = TextEditingController();
    var txtPassword = TextEditingController();
    var txtConfPass = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(

            //padding delimitando as áreas da coluna
            body: Stack(
            
                children : [
            
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 60),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //coluna contendo campos de email, senha e botoes
                            children: [
                            //campos de email, senha e botão de entrar
                                Expanded(
                                    flex: 1,
                                    child: signUp(),
                                ),
                            ],
                        ),
                    ),
                ]
            )
        );
    }

    showMessage(m) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 3), content: Text(m)));
    }

    signUp() {
        return Container(
            
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                    Image.asset('logo.png', height:200,),

                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Cadastrar:", style: TextStyle(color: Colors.white, fontSize: 16),),
                    ),
                    SizedBox(height: 20),
                
                    TextField(
                        controller: txtName,
                        decoration: InputDecoration(
                            labelText: "Nome",
                            border: OutlineInputBorder(),
                        ),
                    ),
                    SizedBox(height: 20),
                    
                    TextField(
                        controller: txtEmail,
                        decoration: InputDecoration(
                            labelText: "E-mail",
                            border: OutlineInputBorder(),
                        ),
                    ),
                    SizedBox(height: 20),

                    TextField(
                        controller: txtPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Senha",
                            border: OutlineInputBorder(),
                        ),
                    ),
                    SizedBox(height: 20),

                    TextField(
                        controller: txtConfPass,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Confirmar Senha",
                            border: OutlineInputBorder(),
                        ),
                    ),
                    SizedBox(height: 30),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                        children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(),
                                onPressed: () => Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login())),
                                child: Text(
                                    "Voltar",
                                    style: TextStyle(
                                        fontSize: 20,
                                    ),
                                )
                            ),
                    
                            ElevatedButton(
                                onPressed: () {
                                    if (txtName.text.isNotEmpty &&
                                        txtEmail.text.isNotEmpty &&
                                        txtPassword.text.isNotEmpty &&
                                        txtConfPass.text.isNotEmpty) {
                                        if (txtPassword.text == txtConfPass.text) {
                                            users.add(
                                                User(
                                                    Random().nextInt(30000).toString(),
                                                    txtName.text,
                                                    txtPassword.text,
                                                    txtEmail.text
                                                    )
                                            );
                                            showMessage("Cadatro realizado com sucesso");
                                            txtName.clear();
                                            txtEmail.clear();
                                            txtPassword.clear();
                                            txtConfPass.clear();
                                        } else {
                                        showMessage(
                                            "As senhas digitadas são diferentes. Insira a mesma senha para cadastrar");
                                        }
                                    } else {
                                        showMessage("Preencha os campos acima para cadastrar");
                                    }
                                },
                                child: Text(
                                    "Cadastrar",
                                    style: TextStyle(
                                        fontSize: 20,
                                    ),
                                )
                            )
                        ]
                    )
                ]
            )
        );
    }
}
