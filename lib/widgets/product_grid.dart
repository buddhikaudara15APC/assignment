import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import '../widgets/product_item.dart';
import '../providers/products_providers.dart';

class ProductGrid extends StatelessWidget {

  final bool showFavs;
  const ProductGrid({
    Key? key,required this.showFavs
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final productData = Provider.of<ProductsProviders>(context);
  final product =showFavs? productData.favouriteItems  :productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (ctx, i) =>ChangeNotifierProvider<Product>.value(
        value: product[i],
        child:const ProductItem(),
        ),
      itemCount: product.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}