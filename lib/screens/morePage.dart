import 'package:flutter/material.dart';
import 'package:wisewords/utills/global.dart';

class morePage extends StatefulWidget {
  const morePage({super.key});

  @override
  State<morePage> createState() => _morePageState();
}

class _morePageState extends State<morePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "More",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  ...MoreData.allData.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          ...e['name'].map(
                            (Map<String, dynamic> e) {
                              return Container(
                                margin: EdgeInsets.only(left: 13),
                                height: 300,
                                width: 205,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "${e['image']}",
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              );
                            },
                          )
                        ],
                      ),
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
