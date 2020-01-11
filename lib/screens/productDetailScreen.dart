import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/productsProvider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title ;

  // ProductDetailScreen(this.title);

  static const routeName = '/productDetail';

  @override
  Widget build(BuildContext context) {
    final pid = ModalRoute.of(context).settings.arguments as String;

    var prod = Provider.of<Products>(
      context,
      listen: false,
    ).findById(pid);

    return Scaffold(
      appBar: AppBar(
        title: Text(prod.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                prod.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${prod.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                prod.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
