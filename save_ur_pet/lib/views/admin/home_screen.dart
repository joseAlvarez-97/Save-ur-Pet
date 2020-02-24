import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:tix_app/src/blocs/now_playing_bloc.dart';
//import 'package:tix_app/src/models/now_playing_models.dart';
//import 'package:tix_app/src/blocs/genres_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

//import 'movies_detail_screen.dart';
//import 'movies_list_screen.dart';
//import 'spotlight_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

//  @override
////  void initState() {
////    super.initState();
//////    bloc.fetchNowPlayingMovies();
//////    bloc.fetchPopularMovie();
//////    genreBloc.fetchAllGenres();
////  }

//  @override
//  void dispose() {
//    super.dispose();
////    bloc.dispose();
////    genreBloc.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:

        LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
//            _pickLocationCell(),            //Dude, SUCURSALES, ETC
            _petsCell(),          //      IMAGENES BONITAS
            _petsContainer(),
          ],
        ),
      ),
    );
  }

  _pickLocationCell() {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(250, 250, 251, 1)),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: <Widget>[
            Image.asset(
              "images/icon_location_pulltheater.png",
              fit: BoxFit.contain,
              width: 16,
              height: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "'SUCURSAL'",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Image.asset(
              "images/ic_triangle_drop_down.png",
              width: 16,
              height: 16,
            )
          ],
        ),
      ),
    );
  }
  _petsCell() {
    return CarouselSlider(

      height: 200,
      viewportFraction: 1.0,
      scrollDirection: Axis.horizontal,
      autoPlay: true,
      aspectRatio: 16 / 9,
      initialPage: 0,
      enableInfiniteScroll: true,
      items: ["Salvalos a todos", "", "", "", ""].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 3.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/gato_diez.jpg"),
                        fit: BoxFit.cover)),
                child: Center(
                    child: Text(
                      '$i',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    )));
          },
        );
      }).toList(),
    );
  }
  _petsContainer() {
    return Padding(

      padding: const EdgeInsets.only(top: 16, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Pets ingresados",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              )),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 16, right: 10),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),

              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                _petItem(),
                _petItem(),
                _petItem(),
                _petItem(),
                _petItem(),
                _petItem(),
                _petItem(),
                _petItem(),
                _petItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  _petItem() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(

            width: 115 ,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/gato_uno.jpg"))),

            //PRE-ESTUPIDEZ



          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "RandomName",
                            maxLines: 1,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),

                        Chip(
                            elevation: 1,

                            label: Text(
                              "Rescatar",
                              style: TextStyle(fontSize: 10),
                              maxLines: 1,
                            )),
                        Chip(
                            elevation: 1,
                            label: Text(
                              "Adoptar",
                              style: TextStyle(fontSize: 10),
                              maxLines: 1,
                            )),

                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 1), () {
      completer.complete();
    });

//    bloc.fetchNowPlayingMovies();
//    bloc.fetchPopularMovie();
//    genreBloc.fetchAllGenres();

    return completer.future.then<void>((_) {
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              })));
    });
  }
}