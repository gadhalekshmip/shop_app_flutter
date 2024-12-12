import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';
//import 'package:shop_app_flutter/global_variable.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context,index){
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String) ,
              radius: 30,
            ),
            trailing: IconButton(
              onPressed: (){
                showDialog(
                  barrierDismissible: false,
                  context: context, 
                builder: (context){
                  return AlertDialog(
                    title: Text('Delete Product',
                    style: Theme.of(context).textTheme.titleMedium,),
                    content:  Text('Are you sure you want to remove the product from your cart',style: Theme.of(context).textTheme.bodySmall,),
                    actions: [
                      TextButton(onPressed: (){
                        context.read<CartProvider>().removeProduct(cartItem); 
                         Provider.of<CartProvider>(context, listen: false).removeProduct(cartItem);
                         Navigator.of(context).pop();}, 
                         child: const Text('Yes',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold) ,)),
                      TextButton(onPressed: (){
                         Navigator.of(context).pop();}, 
                         child: const Text(
                          'No',style:TextStyle(color:Colors.red,fontWeight: FontWeight.bold),)),
                    ],
                  );
                    
          
                },);
              }, 
            icon: const Icon(Icons.delete,color: Colors.red,),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text('Size : ${cartItem['sizes']}',style: const TextStyle(fontWeight: FontWeight.bold),),
            
          );
        },
        ),
    );
  }
}