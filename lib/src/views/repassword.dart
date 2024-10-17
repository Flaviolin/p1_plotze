// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import './login.dart';

import './../controllers/users.dart';

class Repassword extends StatefulWidget {
    const Repassword({super.key});

    @override
    State<Repassword> createState() => _RepasswordState();
}

class _RepasswordState extends State<Repassword> {

    var txtEmail = TextEditingController();
    var txtPassword = TextEditingController();
    var txtConfPass = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(

            //padding delimitando as áreas da coluna
            body: Stack(
                children: [

                    Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 80),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //coluna contendo campos de email, senha e botoes
                            children: [
                                //campos de email, senha e botão de entrar
                                Expanded(
                                    flex: 1,
                                    child: repassword(),
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

    repassword() {
        return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(),

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Image.asset('logo.png', height:200),

                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Recadastrar senha:", style: TextStyle(color: Colors.white, fontSize: 16),),
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
                    SizedBox(height: 20),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(),
                                onPressed: () => Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login())),
                                child: Text("Voltar", style: TextStyle(fontSize: 20),)
                            ),
                    
                            ElevatedButton(
                                onPressed: () {
                                    if (txtEmail.text.isNotEmpty &&
                                        txtPassword.text.isNotEmpty &&
                                        txtConfPass.text.isNotEmpty) {
                                        changePassword(users, txtEmail.text, txtPassword.text);
                                        showMessage("Senha alterada com sucesso");
                                        txtEmail.clear();
                                        txtPassword.clear();
                                        txtConfPass.clear();
                                    } else {
                                        showMessage("Preencha os campos acima para alterar a senha");
                                    }
                                },
                                child: Text("Salvar", style: TextStyle(fontSize: 20),)
                            )
                        ]
                    )
                ]
            )
        );
    }
}
