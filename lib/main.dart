import 'package:flutter/material.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';
//import 'package:shop_app_flutter/global_variable.dart';
import 'package:shop_app_flutter/pages/home_page.dart';
//import 'package:shop_app_flutter/product_details_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Shopping App',
        
        theme: ThemeData(
         
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor:const Color.fromRGBO(254, 206, 1, 1),   
            primary: const Color.fromRGBO(254, 206, 1, 1), 
             ),
            scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 25,
              color: Colors.black,     
            )
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119,119,119,1), ),
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35
                                  ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )
            ),
         useMaterial3: true,
          
        ),
        home:  Provider(
          create: (context) =>'Hello',
          child: const HomePage(
          //      product: products[0],
          ),
        ),
      ),
    );
  }
}