import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/screens/listscreen.dart';
import 'package:movie/screens/secondscreen.dart';

import '../widget/movielist.dart';

class SearchScreen extends StatelessWidget {
  final List list;

  const SearchScreen({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Padding(
            padding:  EdgeInsets.all(12.0),
            child: TextFormField(
              decoration:  InputDecoration(
                
                border: UnderlineInputBorder(),
                hintText: 'Search movie',
                hintStyle: GoogleFonts.poppins()
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height *.8,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DemoScreen(
                                indexnumber: index,
                                url: "http://image.tmdb.org/t/p/w500" +
                                    list[index]['poster_path'],
                                description: list[index]
                                    ["overview"],
                                title: list[index]['title'],
                              ))),
                      child: movielist(
                        number: index,
                        list: list,
                        indexNumber: index,
                      ));
                }),
          )
        ]),
      ),
    );
  }
}
