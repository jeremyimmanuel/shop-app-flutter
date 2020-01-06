import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/productDetailScreen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imgUrl;

  // ProductItem(this.id, this.title, this.imgUrl);


  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);    
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: p.id,
            );
          },
          child: Image.network(
            p.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(p.isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              p.toggleFav();
            },
            color: Theme.of(context).accentColor,
          ),
          backgroundColor: Colors.black87,
          title: Text(
            p.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(p.id, p.price, p.title);
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
