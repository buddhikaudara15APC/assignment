import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';

class EditProductScreen extends StatefulWidget {

  static const routeName = '/edit-product';
  const EditProductScreen({ Key? key }) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {

  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    description: '', 
    id: null??'', 
    imageUrl: '', 
    price: 0, 
    title: '',
    );

  @override
  void initState() {
   _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageController.dispose();
    super.dispose();
  }

  void _updateImageUrl(){
  if (!_imageUrlFocusNode.hasFocus) {
    if (
      (!_imageController.text.startsWith('http') && !_imageController.text.startsWith('https'))
       || 
      (!_imageController.text.endsWith('.png') && !_imageController.text.endsWith('.jpg') && !_imageController.text.endsWith('jpeg'))) {
        return;
      }
                    
    setState(() {
      
    });
  }
  }

  void _saveForm(){
 final isValid =  _form.currentState!.validate();
 if (!isValid) {
   return;
 }
  _form.currentState!.save();
  print(_editedProduct.title);
  print(_editedProduct.description);
  print(_editedProduct.imageUrl);
  print(_editedProduct.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit product'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.save),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Form(
          key: _form as Key,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    description: _editedProduct.description, 
                    id: null??'', 
                    imageUrl: _editedProduct.imageUrl, 
                    price: _editedProduct.price, 
                    title: value??'',
                    );
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please provide a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'price',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                 onSaved: (value) {
                  _editedProduct = Product(
                    description: _editedProduct.description, 
                    id: null??'', 
                    imageUrl: _editedProduct.imageUrl, 
                    price: double.parse(value??''), 
                    title: _editedProduct.title,
                    );
                },
                validator: (value){
                  if (value!.isEmpty) {
                    return 'please provide a price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'please provide a valid number';
                  }
                  if (double.parse(value) <= 0) {
                    return 'please provide a number greater than zero';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (value) {
                  _editedProduct = Product(
                    description: value??'', 
                    id: null??'', 
                    imageUrl: _editedProduct.imageUrl, 
                    price: _editedProduct.price, 
                    title: _editedProduct.title,
                    );
                },
                validator: (value){
                  if (value!.isEmpty) {
                    return 'please provide a description';
                  }
                  if (value.length < 10) {
                    return 'please provide characters should be at least 10';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.only(
                      right: 10,
                      
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: _imageController.text.isEmpty?const Text('Enter a URL') : FittedBox(child: Image.network(_imageController.text,fit: BoxFit.cover,),),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: TextFormField(
                    decoration: const InputDecoration(
                    labelText: 'Image URL',
                    ),
                    controller: _imageController,
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_){
                      _saveForm();
                    },
                    onSaved: (value) {
                  _editedProduct = Product(
                    description: _editedProduct.description, 
                    id: null??'', 
                    imageUrl: value??'', 
                    price: _editedProduct.price, 
                    title: _editedProduct.title,
                    );
                },
                validator: (value){
                  if (value!.isEmpty) {
                    return 'please enter a image url';
                  }
                  if (!value.startsWith('http') && !value.startsWith('https')) {
                    return 'please enter a URL';
                  }
                  if (!value.endsWith('.png') && !value.endsWith('.jpg') && !value.endsWith('jpeg')) {
                    return 'please enter valid image url';
                  }
                },
                    ),
                  ),
                ],
              ),
            ],
          )
          ),
      ),
    );
  }
}