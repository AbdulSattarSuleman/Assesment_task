import 'package:flutter/material.dart';
import 'package:hashlob_task/style.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen(
      {Key? key, required this.productName, required this.productPrice})
      : super(key: key);
  final String productName;
  final String productPrice;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(productName)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            width: screenSize.width,
            height: 100,
            child: Card(
              elevation: 5.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Product:\t ${productName}",
                    style: productTitleStyle,
                  ),
                  Text(
                    'Price:\t ${productPrice}',
                    style: priceStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
