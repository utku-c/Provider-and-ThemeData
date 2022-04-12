// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:example_provider_and_themedata/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20),
        child: Provider.of<CartModel>(context).items.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sepetin boş\nBirşeyler eklemek istermisin?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Eklemek İçin Tıkla',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_task_rounded,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hey there check \nyour Items in cart',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.74,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Name',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Quantity',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Price',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height:
                              (MediaQuery.of(context).size.height * 0.74) - 100,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                child: Consumer<CartModel>(
                                  builder: (context, cart, child) => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          '${cart.items[index].name}',
                                        ),
                                      ),
                                      Text(
                                        '${cart.items[index].quantity}',
                                      ),
                                      SizedBox(
                                        width: 130,
                                      ),
                                      Text(
                                        '${cart.quantity(index) * cart.unitPrice}',
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount:
                                Provider.of<CartModel>(context, listen: false)
                                    .items
                                    .length,
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Total Price',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                  '${Provider.of<CartModel>(context, listen: false).totalPrice}')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<CartModel>(context, listen: false)
                          .clearItem();
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Theme.of(context).secondaryHeaderColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Clear Cart',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
