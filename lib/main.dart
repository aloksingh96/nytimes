import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'model/nytimes_model.dart';
import 'model/web_service/api_service.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<NyResponse> nyNewsList = new List();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "The New York Times",
          ),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                              color: Colors.black,
                            ),
                        itemCount: nyNewsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DetailPage(url:nyNewsList.elementAt(index).url ,)),
                              );
                            },
                            child: Container(
                              //height: MediaQuery.of(context).size.height,
                              child: Column(
                                children: <Widget>[
                                  //first row for section
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          nyNewsList.elementAt(index).section,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  //2nd row for images
                                  Container(

                                    child: Row(
                                      children: <Widget>[
                                        Flexible(
                                          child: Image.network(
                                            nyNewsList
                                                .elementAt(index)
                                                .multimedia
                                                .elementAt(4)
                                                .url,
                                            fit: BoxFit.cover,
                                            height: 300,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.6,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //3rd row for title
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: Text(
                                          nyNewsList.elementAt(index).title,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ))
                                      ],
                                    ),
                                  ),
                                  //4th row for abstract
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            nyNewsList
                                                .elementAt(index)
                                                .abstract,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //5th for hours
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Text(getTimeago(nyNewsList
                                                .elementAt(index)
                                                .updated_date))
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 24),
                                                  child: Icon(
                                                      Icons.bookmark_border),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Icon(Icons.reply)
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
          future: fetchData(),
        ),
      ),
    );
  }

  Future<List<NyResponse>> fetchData() async {
    var response = NyResponses.fromJson(await fetchPost2());
    print(response);
    nyNewsList.addAll(response.results);
    print(nyNewsList.elementAt(0).title);
    return nyNewsList;
  }

  String getTimeago(String updatedDate) {
    DateTime updatedDateTime = DateTime.parse(updatedDate).toUtc();
    return timeago.format(updatedDateTime);
  }
}
