import 'package:flutter/material.dart';
import 'package:hashlob_task/constant.dart';
import 'package:hashlob_task/models/product_model.dart';
import 'package:hashlob_task/screens/product_detail_screen.dart';
import 'package:hashlob_task/services/api_service.dart';
import 'package:shimmer/shimmer.dart';

import '../style.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final inputController = TextEditingController();
  APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(appTitle),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: inputController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  hintText: "Search Product",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Expanded(
              child: FutureBuilder<ApiModel>(
                  future: apiService.getData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: ListTile(
                                  title: Container(
                                    height: 10,
                                    width: screenSize.width * 0.7,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    height: 10,
                                    width: 50,
                                    color: Colors.white,
                                  ),
                                  leading: Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.white,
                                  )),
                            );
                          });
                    } else {
                      return ListView.builder(
                          // itemCount: snapshot.data!.data!.length,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            String productName =
                                snapshot.data!.data![index].name;
                            if (inputController.text.isEmpty) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailScreen(
                                                productName: snapshot
                                                    .data!.data![index].name!,
                                                productPrice: snapshot
                                                    .data!.data![index].price!
                                                    .toString(),
                                              )));
                                },
                                child: ListTile(
                                  title: Text(
                                    snapshot.data!.data![index].name!,
                                    style: productTitleStyle,
                                  ),
                                  subtitle: Text(
                                    "Rs. ${snapshot.data!.data![index].price!}",
                                    style: priceStyle,
                                  ),
                                ),
                              );
                            } else if (productName
                                .toUpperCase()
                                .contains(inputController.text.toUpperCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailScreen(
                                                    productName: snapshot.data!
                                                        .data![index].name!,
                                                    productPrice: snapshot.data!
                                                        .data![index].price!
                                                        .toString(),
                                                  )));
                                    },
                                    child: ListTile(
                                      title: Text(
                                        snapshot.data!.data![index].name!,
                                        style: productTitleStyle,
                                      ),
                                      subtitle: Text(
                                        'Rs. ${snapshot.data!.data![index].price!}',
                                        style: priceStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  }))
        ],
      )),
    );
  }

  void goToDetailPage() {}
}
