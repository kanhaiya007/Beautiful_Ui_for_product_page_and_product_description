import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sampleapp/model/productModel/product.dart';

import 'constants.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: kPrimaryColor,)
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.menu, color: kPrimaryColor,),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.all(6),
              height: 305,
              width: 305,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kSecondaryColor,
              ),
              child: Container(
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: AssetImage("assets/images/image_1_big.png"),
//                    fit: BoxFit.cover,
//                  ),
//                ),
              child: Image.network(widget.product.img),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${widget.product.name}\n",
                        style: Theme.of(context).textTheme.title,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Rs. ${widget.product.price}",
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(color: kPrimaryColor),
                )
              ],
            ),
            SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: widget.product.description,
                style: TextStyle(color: Colors.black,),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 27),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(.19),
                      borderRadius: BorderRadius.circular(27),
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Add to bag",
                          style: Theme.of(context).textTheme.button,
                        ),
                        SizedBox(width: 30),
                        Icon(Icons.arrow_forward, color: Colors.black,)
                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
