import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
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
          
          icon: Icon(Icons.more_vert),
          itemBuilder: (_) =>[
            PopupMenuItem(child: Text('Only Favourite'),value:FilterOptions.Favorite),
            PopupMenuItem(child: Text('Show More'), value:FilterOptions.All)
          ] ,
          
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) =>Badge(
                  child: ch,
                  value: cart.itemCount.toString(),
                ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
  
}






