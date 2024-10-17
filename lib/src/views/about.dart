// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class About extends StatelessWidget {
    const About({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: Text("P1 de Programação de Dispositivos Móveis"),

            ),
            body: Stack(
            alignment: Alignment.center,
                children: [
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 148, bottom: 148),
                        color: Color.fromARGB(199, 0, 0, 0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                Text(
                                    "Aplicação destinada para a avaliação sobre conceitos básicos de desenvolvimento de software com o uso do framework Flutter\n\nDiscentes:",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 18
                                    )
                                ),
                                SizedBox(height: 8),
                                ElevatedButton(
                                child: Text("Voltar"),
                                onPressed: () => Navigator.pop(context),
                                ),
                            ]
                        )
                    )
                ]
            )
        );
    }
}
