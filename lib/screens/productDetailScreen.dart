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
    );
  }
}
