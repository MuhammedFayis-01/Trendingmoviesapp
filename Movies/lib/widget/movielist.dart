import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class movielist extends StatelessWidget {
  final List list;
  final int number;
  final int indexNumber;
  movielist(
      {required this.number, required this.list, required this.indexNumber});

  @override
  Widget build(BuildContext context) {
    return list[indexNumber]["title"] != null
        ? Container(
            padding: EdgeInsets.only(bottom: 10, left: 8),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  list[indexNumber]['title'] != null
                      ? list[indexNumber]["title"]
                      : "Loading",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    'http://image.tmdb.org/t/p/w500' +
                      list[indexNumber]["poster_path"]),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
              color: Colors.black12,
            ),
          )
        : Container();
  }
}
