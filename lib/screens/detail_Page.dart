import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wisewords/screens/Global.dart';
import 'package:wisewords/utills/global.dart';

class detail_page extends StatefulWidget {
  const detail_page({super.key});

  @override
  State<detail_page> createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {
  bool isGridView = false;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${data['catagoryname']}",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Random random = Random();

              int num = random.nextInt(Global.quotes.length - 1);

//   showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Quote"),
//           content: Text(Global.quotes[num].quote),
//         );
//       });
            },
            icon: const Icon(Icons.recommend_sharp),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
            icon:
                Icon((isGridView) ? Icons.grid_view_rounded : Icons.list_sharp),
          ),
        ],
      ),
      body: Scrollbar(
          child: (isGridView)
              ? GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 2,
                    childAspectRatio: 1 / 2,
                  ),
                  children:
                      List.generate(data['categoryQuotes'].length, (index) {
                    var e = data['categoryQuotes'][index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red,
                          image: DecorationImage(
                            image: NetworkImage("${e['image']}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 60, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 180,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.format_quote,
                                          color: Colors.white,
                                          size: 60,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${e['quote']}",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${e['author']}",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                )
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...data['categoryQuotes']
                                  .map(
                                    (e) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Container(
                                        height: 600,
                                        width: 400,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.red,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "${e['image']}",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 300,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons.format_quote,
                                                          color: Colors.white,
                                                          size: 60,
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      "${e['quote']}",
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          "${e['author']}",
                                                          style: TextStyle(
                                                              fontSize: 27,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 100,
                                                              top: 10,
                                                              left: 100),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                QuoteData
                                                                    .favData
                                                                    .add(e);
                                                                QuoteData
                                                                    .favQuoteData
                                                                    .add(e);
                                                                QuoteData
                                                                    .convertData();

                                                                e['like'] =
                                                                    !e['like'];
                                                              });
                                                            },
                                                            child: Container(
                                                              height: 47,
                                                              width: 47,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.5)),
                                                              // child: Icon(Icons
                                                              //     .favorite),

                                                              child: Icon(
                                                                e['like']
                                                                    ? Icons
                                                                        .favorite
                                                                    : Icons
                                                                        .favorite_border,
                                                                color: e['like']
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .black,
                                                                size: 27,
                                                              ),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                // QuoteData
                                                                //     .editData
                                                                //     .add(e);
                                                                // QuoteData
                                                                //     .allEditData
                                                                //     .add(e);
                                                                // QuoteData
                                                                //     .convertData();

                                                                // e['edit'] =
                                                                //     !e['edit'];
                                                              });
                                                            },
                                                            child: Container(
                                                              height: 47,
                                                              width: 47,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                              ),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pushNamed(
                                                                          'editPage',
                                                                          arguments:
                                                                              data);
                                                                  setState(() {
                                                                    QuoteData
                                                                        .editData
                                                                        .add(e);
                                                                    QuoteData
                                                                        .convertEditData();
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons.edit,
                                                                  size: 27,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
    );
  }
}
