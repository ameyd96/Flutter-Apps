import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;

  // ProductDetailScreen(this.title);

  static const routeName = 'product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;

    final loadedProduct =
    //listen:false it will listen when products data is changed ,otherwise it will nt listen 
    //and only renders screen when data cahnged

    //findById is method written in Product provider
        Provider.of<Products>(context, listen: false).findById(productId);
    // Provider.of<Products>(context, listen: false).items
    // .firstWhere((prod) => prod.id == productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
