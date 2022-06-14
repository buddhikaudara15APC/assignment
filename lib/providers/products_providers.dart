import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';


class ProductsProviders with ChangeNotifier{

final List<Product> _items = [
    Product(
      description: 'This is my bicycle', 
      id: 'd1', 
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV0Cd5rgG9-U_PrfZw2lk5Xj33WgERsxNO5g&usqp=CAU', 
      price: 100.99, 
      title: 'platina'
      ),

    Product(
      description: 'This is my car', 
      id: 'd2', 
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP-8_StBeeOggj7OjHXyC3CZdCzqzJyyGPiw&usqp=CAU', 
      price: 30.85, 
      title: 'susuki-maruti'
      ),

    Product(
      description: 'This is my cart', 
      id: 'd3', 
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqqb-SKg2SQjPxqoleV98Ba9b37nRJ48xVJw&usqp=CAU', 
      price: 8384.834, 
      title: 'cart'
      ),

    Product(
      description: 'This is my helicopter', 
      id: 'd4', 
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd2Aff56mPIpeHb6x0fJhP6uDJPp4ORm2ayg&usqp=CAU', 
      price: 747.84, 
      title: 'Helicopter'
      ),
  ];



List<Product> get items{
  // if (_showFavouriteOnly) {
  //  return _items.where((prodItem) => prodItem.isFavourite).toList();
  // }
  return [..._items];
}

List<Product> get favouriteItems{
   return _items.where((prodItem) => prodItem.isFavourite).toList();
}

Product findById(String id){
return _items.firstWhere((prod) => prod.id == id);
}

void addProduct(){
  // _items.add(value);
  notifyListeners();
}

}