import 'package:flutter/material.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/user_products_screen.dart';
import './providers/orders.dart';
import './screens/cart_screen.dart';
import './providers/cart.dart';
import './providers/products_providers.dart';
import './screens/product_details_screen.dart';
import './screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
      create: (context) => ProductsProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
          ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
          ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Anton', 
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(secondary: Colors.orange)
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailsScreen.routeName:(context)=>const ProductDetailsScreen(),
          CartScreen.routeName:(context)=>const CartScreen(),
          OrdersScreen.routeName:(context)=> const OrdersScreen(),
          UserProductsScreen.routeName:(context)=> const UserProductsScreen(),
          EditProductScreen.routeName:(context)=> const EditProductScreen(),
        },
      ),
    );
  }
}

//start 30