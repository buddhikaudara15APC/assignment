import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';
import '../widgets/product_grid.dart';

enum FilterOptions{
favourites,
all
}

class ProductsOverviewScreen extends StatefulWidget {

   const ProductsOverviewScreen({ Key? key }) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {

  var _showFavouiteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected:(FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favourites) {
              _showFavouiteOnly = true;
            } else {
              _showFavouiteOnly = false;
            }
              });
            
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => <PopupMenuItem<FilterOptions>>[
               const PopupMenuItem<FilterOptions>(
              child: Text('Only Favourites'), 
              value: FilterOptions.favourites
              ),
              
              const PopupMenuItem<FilterOptions>(
              child: Text('show All'), value: FilterOptions.all),
            ],
            ),
            Consumer<Cart>(
              builder: (context,cart,child)=>
              Badge(
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                }, 
                icon: const Icon(Icons.shopping_cart)
                ), 
              color: Theme.of(context).colorScheme.secondary, 
              value: cart.itemCount.toString()
              ),
              ),
        ],
      ),
      drawer: const AppDrawer(),
    body: ProductGrid(showFavs:_showFavouiteOnly),
    );
  }
}

