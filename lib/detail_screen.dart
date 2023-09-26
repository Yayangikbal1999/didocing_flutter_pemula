import 'package:flutter/material.dart';
import 'package:wisata/models/wisata.dart';

class DetailScreen extends StatelessWidget {
  final Wisatas wisata;

  const DetailScreen({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return DetailMobilePage(wisatas: wisata);
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final Wisatas wisatas;

  const DetailMobilePage({Key? key, required this.wisatas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(wisatas.picture),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              wisatas.name,
                              style: const TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF52525B)),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Row(children: [
                                const Icon(
                                  Icons.star,
                                  size: 22.0,
                                  color: Color(0xFFFFD700),
                                ),
                                Text(
                                  wisatas.rating.toString(),
                                  style: const TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF52525B)),
                                ),
                              ]))
                        ],
                      ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_pin,
                            size: 16.0,
                            color: Color(0xFFBF1722),
                          ),
                          Text(
                            wisatas.city,
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      wisatas.address,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ))
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
                child: const Text(
                  'Deskripsi:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  wisatas.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
