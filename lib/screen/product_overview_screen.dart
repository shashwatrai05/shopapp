import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/screen/cart_screen.dart';
import 'package:shopapp/widgets/app_drawer.dart';
//import 'package:provider/provider.dart';
//import 'package:shopapp/providers/product.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';



enum FilterOptions{
  Favorite,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites=false;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(onSelected: (FilterOptions selectedValue){
            setState(() {
              if(selectedValue==FilterOptions.Favorite){
_showOnlyFavorites=true;
}
else{
  _showOnlyFavorites=false;
}
            }
            );

          },
          
          icon: const Icon(Icons.more_vert),
          itemBuilder: (_) =>[
            const PopupMenuItem(child: Text('Only Favourite'),value:FilterOptions.Favorite),
            const PopupMenuItem(child: Text('Show More'), value:FilterOptions.All)
          ] ,
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badgee(
                  child: ch,
                  value: cart.itemCount.toString(),
                  color: Colors.red,
                ) ,
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
  
}






