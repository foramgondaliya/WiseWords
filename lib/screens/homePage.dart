import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wisewords/model/quote.dart';
import 'package:wisewords/screens/Global.dart';
import 'package:wisewords/utills/global.dart';

class home_Page extends StatefulWidget {
  const home_Page({super.key});

  @override
  State<home_Page> createState() => _home_PageState();
}

class _home_PageState extends State<home_Page> {
  List<Color> containerColors = [
    Color(0xff008080),
    Color(0xff3C5B6F),
    Color(0xff8F9779),
    Color(0xffCA8787),
  ];
  @override
  void initState() {
    Global.quotes = QuoteData.allProductData
        .map(
          (e) => Quotes.fromMap(data: e),
        )
        .toList();
    super.initState();
  }

  int colorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quotes",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('favouritePage');
            },
            child: Icon(
              Icons.favorite_border,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('more');
                },
                child: Icon(Icons.more)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //color: Colors.amber,
              child: Column(
                children: [
                  ...QuoteData.allProductData.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...e['catagory'].map(
                            (Map<String, dynamic> e) {
                              Color color = containerColors[colorIndex];
                              colorIndex =
                                  (colorIndex + 1) % containerColors.length;
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('detailPage', arguments: e);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 200,
                                  width: 200,
                                  color: color,
                                  child: Text(
                                    "${e['catagoryname']}",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
