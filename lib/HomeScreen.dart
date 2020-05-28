import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sampleapp/services.dart';
import 'package:sampleapp/widgets/category_title.dart';
import 'package:sampleapp/widgets/food_card.dart';

import 'constants.dart';
import 'details_screen.dart';
import 'model/productModel/product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> productList = new List<Product>();
  bool _progress = true;
  Future<List<Product>> mfuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mfuture = getProductList();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Visibility(
              visible: _progress,
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
              )),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 50),
            child: Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                "assets/icons/menu.svg",
                height: 11,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "All Products on Offer! \n Hurry!!!",
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                CategoryTitle(title: "All", active: true),
                CategoryTitle(title: "Laptop"),
                CategoryTitle(title: "Mobile"),
                CategoryTitle(title: "Speakers"),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kBorderColor),
            ),
            child: SvgPicture.asset("assets/icons/search.svg"),
          ),
          FutureBuilder(
            builder: (context, projectSnap) {
              if (!projectSnap.hasData) {
                return Container(
                  height: 300,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                    ),
                  ),
                );
              }
              return Container(
                height: 450,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: projectSnap.data.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DetailsScreen(
                                product: projectSnap.data[index],
                              );
                            }),
                          );
                        },
                        title: projectSnap.data[index].name,
                        image: projectSnap.data[index].img,
                        price: projectSnap.data[index].price,
                        code: projectSnap.data[index].code,
                        description: projectSnap.data[index].description,
                      );
                    }),
              );
            },
            future: mfuture,
          )
        ],
      ),
    );
  }

  Future<List<Product>> getProductList() async {
    productList = await Services().getApiData();
    if (productList != null) {
      setState(() {
        _progress = false;
      });
      return productList;
    }
    return productList;
  }
}
