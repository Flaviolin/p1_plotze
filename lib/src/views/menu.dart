// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import './../models/food.dart';
import './../models/order.dart';

import './../controllers/orders.dart';

import './../views/shopcart.dart';

class Menu extends StatefulWidget {
    const Menu({super.key});

    @override
    State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
    Food item = Food("00", "", "", "", 0.00);
    var txtQuantity = TextEditingController();

    Widget build(BuildContext context) {
        return Scaffold(

            appBar: AppBar(
                title: Text("Cardápio"),
                leading: IconButton(
                    icon: Icon(Icons.exit_to_app),
                    tooltip: 'Sair',
                    onPressed: () {
                        Navigator.pop(context);
                    }
                ),
                actions: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.shopping_bag_rounded),
                        tooltip: 'Pedido',
                        onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ShopCart()));
                        },
                    ),
                ],
            ),

            body: SingleChildScrollView(
                child: Expanded(
                    flex: 1,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Text("Pratos principais"),
                            mainDishes(),
                            Text("Porções"),
                            sideDishes(),
                            Text("Sobremesas"),
                            desserts(),
                            Text("Bebidas"),
                            drinks(),
                        ]
                    )
                )
            )
        );
    }

    select(Food food) {
        item = food;
    }

    // Pratos principais
    mainDishes() {
        return listFoods(mainMenu);
    }

    // Porções
    sideDishes() {
        return listFoods(sideMenu);
    }

    // Sobremesas
    desserts() {
        return listFoods(dessertMenu);
    }

    // Bebidas
    drinks() {
        return listFoods(drinkMenu);
    }

    showMessage(m) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(seconds: 5), content: Text(m)));
    }

    listFoods(List<Food> f) {
        return Container(
            height: 400,
            child: ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: f.length,
                itemBuilder: (BuildContext context, int index) {
                    return Center(
                        child: Card(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                    ListTile(
                                        leading: Image.asset(f[index].imagePath, height:100, width:100),
                                        title: Text(f[index].name),
                                        subtitle: Text(f[index].description),
                                        onTap: () {
                                            select(f[index]);
                                            _dialogBuilder(context);
                                        }
                                    ),
                                ]
                            )
                        )
                    );
                }
            )
        );
    }

    Future<void> _dialogBuilder(BuildContext context) {
        return showDialog<void>(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text(item.name),
                    content: Image.asset(item.imagePath, height:350, width: 350),
                    actions: <Widget>[
                        Text(item.description),
                        
                        TextField(
                            controller: txtQuantity,
                            decoration: InputDecoration(
                                labelText: "Quantidade",
                                border: OutlineInputBorder(),
                            ),
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                                TextButton(
                                    style: TextButton.styleFrom(
                                        textStyle: Theme.of(context).textTheme.labelLarge,
                                    ),
                                    child: const Text('Remover'),
                                    onPressed: () {
                                        removeItem(order, item, int.parse(txtQuantity.text));
                                        Navigator.of(context).pop();
                                    },
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        textStyle: Theme.of(context).textTheme.labelLarge,
                                    ),
                                    child: const Text('Adicionar'),
                                    onPressed: () {
                                        addItem(order, item, int.parse(txtQuantity.text));
                                        String qtd = txtQuantity.text;
                                        String nm = item.name.toUpperCase();
                                        showMessage('$qtd x $nm adicionado a sua sacola');
                                        Navigator.of(context).pop();
                                    },
                                ),
                            ]
                        )
                    ],
                );
            },
        );
    }
}
