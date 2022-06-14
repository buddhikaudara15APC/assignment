import 'package:flutter/material.dart';
import 'package:shop_app/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {

  final String title;
  final String imageUrl;
  const UserProductItem({ Key? key,required this.title,required this.imageUrl }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListTile(
          title: Text(title),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
          trailing: SizedBox(
            width: 100,
            child: Row(
                children: [
                  IconButton(
                    onPressed: (){
                      // Navigator.of(context).pushNamed(EditProductScreen.routeName);
                    }, 
                    icon:  const Icon(
                      Icons.edit,
                      ),
                      color: Colors.purple
                    ),
                    IconButton(
                    onPressed: (){}, 
                    icon: const Icon(
                      Icons.delete,
                      ),
                      color: Theme.of(context).errorColor
                    ),
                ],
            ),
          ),
      ),
    );
  }
}