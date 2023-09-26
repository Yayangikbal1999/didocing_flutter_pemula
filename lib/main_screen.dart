import 'package:flutter/material.dart';
import 'package:wisata/models/wisata.dart';
import 'package:wisata/models/wisata_data.dart';
import 'package:wisata/detail_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text(
            "Tempat wisata",
            // ignore: prefer_const_constructors
            style: TextStyle(
                color: const Color(0xFF52525B),
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFF3F7F9),
          elevation: 1,
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return const WisatasList();
        }),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFFF3F7F9),
          fixedColor: const Color(0xFFBF1722),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'suka',
            ),
          ],
        ),);
  }
}

class WisatasList extends StatelessWidget {
  const WisatasList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemBuilder: (context, index) {
        final Wisatas wisatas = wisatasList[index];
        return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen( wisata: wisatas);
              }));
            },
            child: SizedBox(
              height: 135,
              child: Card(
                color: const Color(0xFFF3F7F9),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        child: Image.asset(
                          wisatas.thumbnail,
                          fit: BoxFit.cover,
                          height: 135,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5, left: 5, right: 5, bottom: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 5, right: 5),
                              child: Text(
                                wisatas.name,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF52525B)),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_pin,
                                        size: 16.0,
                                        color: Color(0xFFBF1722),
                                      ),
                                      Text(
                                        wisatas.city,
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(children: [
                                    const Icon(
                                      Icons.star,
                                      size: 16.0,
                                      color: Color(0xFFFFD700),
                                    ),
                                    Text(
                                      wisatas.rating.toString(),
                                      style: const TextStyle(fontSize: 16.0),
                                    ),
                                  ]),
                                )
                              ],
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, bottom: 5),
                              child: Text(
                                wisatas.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
      itemCount: wisatasList.length,
    );
  }
}
