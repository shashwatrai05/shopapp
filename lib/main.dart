import 'package:flutter/material.dart';
import 'package:shopapp/providers/orders.dart';
import 'package:shopapp/screen/cart_screen.dart';
import 'package:shopapp/screen/product_detail_screen.dart';
import './screen/product_overview_screen.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';
import './providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
ChangeNotifierProvider(
      create:(ctx)=> Products(),),
ChangeNotifierProvider(
  create:(ctx)=> Cart()),
ChangeNotifierProvider(
  create: (ctx)=>Orders())

    ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName:(ctx) => ProductDetailScreen(),
          CartScreen.routeName:(ctx)=> CartScreen(),
        },
      ),
    );
  }
}

