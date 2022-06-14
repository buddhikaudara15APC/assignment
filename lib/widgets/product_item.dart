import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import '../providers/product.dart';
import '../screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {

 const ProductItem({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return  ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailsScreen.routeName,
                arguments: product.id,
              );
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              ),
          ),
            footer:GridTileBar(
              backgroundColor: Colors.black87,
              leading: Consumer(
             builder: (context, value, child) =>
              IconButton(
                 color: Theme.of(context).colorScheme.secondary,
                onPressed:(){
                product.toggleFavouriteStatus();
                } ,
                icon: Icon(
                 product.isFavourite? Icons.favorite : Icons.favorite_border
                  ),
                ),
                child: const Text('Never changes'),
              ),
              title: Text(
                product.title,
                textAlign: TextAlign.center,
                ),
                trailing: IconButton(
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: (){
                    cart.addItem(product.id, product.price, product.title);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar;
                    ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                        content: const Text("Added Item to the Cart!",textAlign: TextAlign.center,),
                        duration: const Duration(seconds: 2),
                        action: SnackBarAction(
                          label: 'UNDO', 
                          onPressed: (){
                            cart.removeSingleItem(product.id);
                          }
                          ),
                        ),
                    );
                  }, 
                  icon: const Icon(Icons.shopping_cart),
                ),
            ),
        ),
    );
  }
}