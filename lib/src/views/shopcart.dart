// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import './../models/food.dart';

import './../controllers/orders.dart';

class ShopCart extends StatefulWidget {
    const ShopCart({super.key});

    @override
    State<ShopCart> createState() => _ShopCartState();
}

class _ShopCartState extends State<ShopCart> {
    Food item = Food("00", "", "", "", 0.00);
    var txtQuantity = TextEditingController();

    Widget build(BuildContext context) {
        return Scaffold(

            appBar: AppBar(
                title: Text("Pedido"),
            ),

            body: SingleChildScrollView(
                child: Expanded (
                    flex: 1,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            orders(),
                        ]
                    )
                )
            ),

            bottomNavigationBar: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                child: Container(height: 50.0),
            ),
        );
    }

    orders() {
        return listFoods(order.itemsOrdered);
    }

    // To manage state about what is being select
    select(Food food) {
        item = food;
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
                                        leading:  Text(f[index].imagePath),
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
                    content: Text(item.description),
                    actions: <Widget>[
                        TextField(
                            controller: txtQuantity,
                            obscureText: true,
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
