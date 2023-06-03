import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/widgets/app_drawer.dart';
import '../providers/products.dart';
import '../widgets/user_product.dart';
import './edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName='/user_products';

  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(onPressed: ()
          {
            Navigator.of(context).pushNamed(EditProductScreen.routeName);
          }, icon: const Icon(Icons.add))
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: productsData.items.length,
        itemBuilder: (_,i)=> Column(
          children: [
            UserProductItem(
              productsData.items[i].title, 
              productsData.items[i].imageUrl,
              productsData.items[i].id),
          const Divider(),
          ],
        )
        ),
      ),
    );
  }
}