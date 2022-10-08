import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/screens/search.dart';
import 'package:movie/screens/secondscreen.dart';

import 'package:movie/widget/movielist.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../utils/constants.dart';

class Listscreen extends StatefulWidget {
  const Listscreen({Key? key}) : super(key: key);

  @override
  State<Listscreen> createState() => _ListscreenState();
}

class _ListscreenState extends State<Listscreen> {
  List trendingMoviesGlobal = [];
  loadMovies() async {
    TMDB tmdb = TMDB(ApiKeys(apiKey, accessToken));
    logConfig:
    ConfigLogger(
      showLogs: true, //must be true than only all other logs will be shown
      showErrorLogs: true,
    );
    Map trendingMovies = await tmdb.v3.trending.getTrending();
    // print(trendingMovies);
    setState(() {
      trendingMoviesGlobal = trendingMovies["results"];
    });
    print(trendingMoviesGlobal);
  }

 Future loadTitle()async{
  TMDB tmdb = TMDB(ApiKeys(apiKey, accessToken));


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'watch',
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()),
                        );
                      },
                      icon: const Icon(Icons.search,color: Colors.black,))
                ],
              ),
            ),
            body: ListView.builder(
                itemCount: trendingMoviesGlobal.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DemoScreen(indexnumber: index,url: "http://image.tmdb.org/t/p/w500"+trendingMoviesGlobal[index]['poster_path'],description: trendingMoviesGlobal[index]["overview"],title: trendingMoviesGlobal[index]['title'],))),
                      child: movielist(
                        number: index,
                        list: trendingMoviesGlobal,
                        indexNumber: index,
                      ));
                })));
  }
}
