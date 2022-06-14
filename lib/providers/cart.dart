import 'package:flutter/material.dart';

class CartItem{
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.price,
    required this.quantity,
    required this.title
  });
}

class Cart with ChangeNotifier{

 Map<dynamic,CartItem> _items = {};

Map<dynamic,CartItem> get items{
  return {..._items};
}

int get itemCount{
  return _items.length;
}

void removeItem(String productId){
  _items.remove(productId);
  notifyListeners();
}

double get totalAmount{
  var totalSum = 0.0;
   _items.forEach((key, cartItem) { 
    totalSum += cartItem.price * cartItem.quantity;
  });
  return totalSum;
}

void addItem(String productId,double price,String title){

if (_items.containsKey(productId)) {
  _items.update(productId, 
  (existingCartItem) => CartItem(
    id: existingCartItem.id, 
    price: existingCartItem.price, 
    quantity: existingCartItem.quantity + 1, 
    title:existingCartItem.title ,
    ));
}else{
  _items.putIfAbsent(productId, 
  () => CartItem(
    id: productId, 
    price: price, 
    quantity: 1, 
    title: title),
    );
}
notifyListeners();
}

void removeSingleItem(String productId){
if (!_items.containsKey(productId)) {
  return;
}
if (_items[productId]!.quantity > 1) {
  _items.update(productId, (existingCartItem) => CartItem(
    id: existingCartItem.id, 
    price: existingCartItem.price, 
    quantity: existingCartItem.quantity - 1, 
    title: existingCartItem.title)
    );
} else {
  _items.remove(productId);
}
notifyListeners();
}

void clear(){
_items = {};
notifyListeners();
}

}