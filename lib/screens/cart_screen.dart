import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widgets/cart_item.dart';
import '../providers/cart.dart' ;

class CartScreen extends StatelessWidget {

  static const routeName = '/cart-screen';
  const CartScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
  final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children:  [
          Card(
            margin: const EdgeInsets.all(10),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 20
                  ),
                  ),
                  const Spacer(),
                  Chip(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    label: Text(
                  '\$${cart.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                  ),
                  ),
                  TextButton(
                    onPressed: (){
                      Provider.of<Orders>(context,listen: false).addOrder(cart.items.values.toList(),cart.totalAmount);
                      cart.clear();
                    }, 
                    child: Text(
                      'Order Now',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                      ),
                      )
                    ),
                    
                ],
              ),
              ),
          ),
          const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (ctx,i)=> CartItem2(
                          id: cart.items.values.toList()[i].id,
                          productId:cart.items.keys.toList()[i], 
                          title: cart.items.values.toList()[i].title,
                          price: cart.items.values.toList()[i].price, 
                          quantity: cart.items.values.toList()[i].quantity,
                          ),
                        itemCount: cart.items.length,
                        ),
                      ),
        ],
      ),
    );
  }
}