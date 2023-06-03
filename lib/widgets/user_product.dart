import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/screen/edit_product_screen.dart';


class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;
  const UserProductItem(this.title,this.imageUrl,this.id);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
            onPressed: (){
             Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id);
            }, 
            icon: const Icon(Icons.edit),
            color: Theme.of(context).primaryColor,
            ),
          IconButton(
            onPressed: (){
              Provider.of<Products>(context,listen:false).deleteProduct(id);
            },
           icon: const Icon(Icons.delete),
           color: Theme.of(context).colorScheme.error,
             ),
        ],),
      ),
      );
  }
}