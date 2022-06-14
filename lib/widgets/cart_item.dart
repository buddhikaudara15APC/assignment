import 'package:flutter/material.dart' ;
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';

class CartItem2 extends StatelessWidget {

  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;
  const CartItem2({ 
    Key? key,
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.productId 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        Provider.of<Cart>(context,listen: false).removeItem(productId);
      } ,
      confirmDismiss: (direction) => showDialog(
        context: context, 
        builder: (context)=>AlertDialog(
         title: const Text('Are you sure?'),
         content: const Text('Do you want to remove this item from the cart?'),
         actions: [
           TextButton(
             onPressed: (){
               Navigator.of(context).pop(false);
             }, 
             child: const Text('No')
             ),
           TextButton(
             onPressed: (){
               Navigator.of(context).pop(true);
             }, 
             child: const Text('Yes')
             ),
         ],
        ),
        ),
      key: ValueKey(id),
      background: Container(
        // alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(10),
        margin:const EdgeInsets.all(10),
        color: Theme.of(context).errorColor,
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        margin:const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
            child: const Icon(Icons.delete),
            color: Colors.red,
          ),
      // secondaryBackground: const Icon(Icons.delete),
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Text(
                    "/${price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Colors.white
                    ),
                    ),
                  ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: /${(price * quantity).toStringAsFixed(2)}'),
            trailing: Text('x $quantity'),
          ),
          ),
      ),
    );
  }
}