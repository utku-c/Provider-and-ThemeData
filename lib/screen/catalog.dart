// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace, use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers

import 'package:example_provider_and_themedata/model/cart.dart';
import 'package:example_provider_and_themedata/model/custom_theme_data.dart';
import 'package:example_provider_and_themedata/screen/view_cart.dart';
import 'package:example_provider_and_themedata/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCatalog extends StatelessWidget {
  List<Item> catalogitems = [
    Item(0, 'Telefon', 1),
    Item(1, 'Tablet', 1),
    Item(2, 'Saat', 1),
    Item(3, 'Bilgisayar', 1),
    Item(4, 'Charger', 1),
    Item(5, 'Fare', 1),
    Item(6, 'Klavye', 1),
    Item(7, 'Monitör', 1),
    Item(8, 'Ekran', 1),
    Item(9, 'Masa', 1),
    Item(10, 'Trackpad', 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    'Ne almak \n istersin?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                newMethodThemeChipButton(context)
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.77,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${catalogitems[index].name}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          Text(''),
                          GestureDetector(
                            onTap: () {
                              if (Provider.of<CartModel>(context, listen: false)
                                  .items
                                  .contains(catalogitems[index])) {
                                catalogitems[index].quantity++;
                              } else {
                                Provider.of<CartModel>(context, listen: false)
                                    .addItem(index, catalogitems[index]);
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Theme.of(context).selectedRowColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.add_task,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 28,
                              )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  );
                },
                itemCount: catalogitems.length,
              ),
            ),
            newMethodViewCartButton(context)
          ],
        ),
      ),
    );
  }

  GestureDetector newMethodViewCartButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => CartScreen(),
          ),
        );
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            'View Cart',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Container newMethodThemeChipButton(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ActionChip(
            label: Icon(
              Icons.circle,
              color: Colors.purple,
            ),
            onPressed: () {
              Provider.of<CustomThemeDataModel>(context, listen: false)
                  .setThemeData(myThemePurple);
            },
          ),
          ActionChip(
            label: Icon(
              Icons.circle,
              color: Colors.green,
            ),
            onPressed: () {
              Provider.of<CustomThemeDataModel>(context, listen: false)
                  .setThemeData(myThemeGreen);
            },
          ),
          ActionChip(
            label: Icon(
              Icons.circle,
              color: Colors.white,
            ),
            onPressed: () {
              Provider.of<CustomThemeDataModel>(context, listen: false)
                  .setThemeData(ThemeData.light());
            },
          ),
          ActionChip(
            label: Icon(
              Icons.circle,
              color: Colors.black,
            ),
            onPressed: () {
              Provider.of<CustomThemeDataModel>(context, listen: false)
                  .setThemeData(ThemeData.dark());
            },
          ),
        ],
      ),
    );
  }
}
