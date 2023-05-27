import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/providers/product.dart';
import 'package:shopapp/screen/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
 //final String id;
 //final String title;
 //final String imageUrl;

 //ProductItem(this.id,this.title,this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product= Provider.of<Product>(context,listen: false);
    final cart=Provider.of<Cart>(context,listen:false);
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              ),
          ),
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              leading: Consumer<Product>(
      builder: (ctx, product, _) =>
                IconButton(onPressed:(){
                  product.togglefavouriteScreen();
                }, 
      
                color:Theme.of(context).accentColor,
                icon: Icon(product.isFavourite? Icons.favorite:Icons.favorite_border_outlined),
                ),
                
              ),
              title: Text(
                product.title,
                textAlign: TextAlign.center,
                ),
                trailing: IconButton(
                  onPressed: (){
                    cart.additem(product.id, product.price, product.title);
                  }, 
                  icon: const Icon(Icons.shopping_cart),
                  color: Theme.of(context).accentColor,
                  ),
            ),
            ),
      
    
    );
  }
}