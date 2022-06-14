import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_providers.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({ Key? key }) : super(key: key);
  static const routeName = '/ProductDetailsScreen';
  @override
  Widget build(BuildContext context) {

  final productId = ModalRoute.of(context)!.settings.arguments as String;
  final loadedProduct = Provider.of<ProductsProviders>(context,listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
                ),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${loadedProduct.price}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
              ),
              const SizedBox(height: 10),
              Text(
                loadedProduct.description,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
                ),
          ],
        ),
      ),
    );
  }
}